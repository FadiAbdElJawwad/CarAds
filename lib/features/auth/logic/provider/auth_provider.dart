import 'dart:io';
import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/core/constant/app_constants.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/features/auth/model/auth_state.dart';
import 'package:car_ads/features/auth/model/user_model.dart';
import 'package:car_ads/features/auth/logic/helper/auth_service.dart';
import 'package:car_ads/core/services/car_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  final FirebaseFirestore _firestore;
  final FlutterSecureStorage _storage;
  final CarFirestoreService _firestoreService;
  final NotificationService _notificationService;

  AuthProvider({
    AuthService? authService,
    FirebaseFirestore? firestore,
    FlutterSecureStorage? storage,
    CarFirestoreService? firestoreService,
    NotificationService? notificationService,
  }) : _authService = authService ?? AuthService(),
       _firestore = firestore ?? FirebaseFirestore.instance,
       _storage = storage ?? const FlutterSecureStorage(),
       _firestoreService = firestoreService ?? CarFirestoreService(),
       _notificationService = notificationService ?? NotificationService();

  AuthState _state = const AuthState();

  AuthState get state => _state;

  void _setState(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> _handleAuthOperation(Future<void> Function() operation) async {
    _setState(_state.copyWith(status: AuthStatus.loading));
    try {
      await operation();
      _setState(_state.copyWith(status: AuthStatus.success));
    } on FirebaseAuthException catch (e) {
      _setState(
        _state.copyWith(
          status: AuthStatus.failure,
          errorKey: e.code,
          fallbackMessage: e.message,
        ),
      );
    } catch (e) {
      _setState(
        _state.copyWith(
          status: AuthStatus.failure,
          fallbackMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _storeUserDataLocal(String uid, {String? role}) async {
    await _storage.write(key: AppConstants.storageKeyUid, value: uid);
    await _storage.write(key: AppConstants.storageKeyLogin, value: 'true');
    if (role != null) {
      await _storage.write(key: AppConstants.storageKeyRole, value: role);
    }
  }

  Future<void> _clearUserDataLocal() async {
    await _storage.delete(key: AppConstants.storageKeyUid);
    await _storage.delete(key: AppConstants.storageKeyLogin);
    await _storage.delete(key: AppConstants.storageKeyRole);
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String role,
  }) async {
    await _handleAuthOperation(() async {
      final userCredential = await _authService.signUpUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      final user = userCredential.user;
      if (user != null) {
        final userData = {
          'name': name,
          'email': email,
          'uid': user.uid,
          'phone': phone,
          'role': role,
        };

        if (role == 'showroom') {
          userData['showroomName'] =
              name; // Auto-fill showroomName with user's name
          userData['commercialRegister'] = '';
        }

        await _firestore
            .collection(AppConstants.usersCollection)
            .doc(user.uid)
            .set(userData);
        await _storeUserDataLocal(user.uid, role: role);
        // Explicitly update FCM token immediately after UID is saved locally
        await _notificationService.updateFcmTokenForUser(user.uid);
        await fetchUserData();
        await _notificationService.sendNotification(
          userId: user.uid,
          title: 'Welcome !',
          body: 'You have create account successfully.',
        );
      }
    });
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    await _handleAuthOperation(() async {
      final userCredential = await _authService.loginUser(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        // Fetch role from Firestore
        final doc = await _firestore
            .collection(AppConstants.usersCollection)
            .doc(user.uid)
            .get();
        final role = doc.data()?['role'] as String? ?? 'user';

        await _storeUserDataLocal(user.uid, role: role);
        // Explicitly update FCM token immediately after UID is saved locally
        await _notificationService.updateFcmTokenForUser(user.uid);
        await fetchUserData();
        await _notificationService.sendNotification(
          userId: user.uid,
          title: 'Welcome Back!',
          body: 'You have logged in successfully.',
        );
      }
    });
  }

  Future<void> logout() async {
    await _handleAuthOperation(() async {
      await _authService.signOut();
      await _clearUserDataLocal();
      _setState(const AuthState(status: AuthStatus.initial));
    });
  }

  Future<void> resetPassword({required String email}) async {
    await _handleAuthOperation(() async {
      await _authService.sendPasswordResetEmail(email: email);
    });
  }

  Future<void> fetchUserData() async {
    final uid = await _storage.read(key: AppConstants.storageKeyUid);
    if (uid != null) {
      final doc = await _firestore
          .collection(AppConstants.usersCollection)
          .doc(uid)
          .get();
      if (doc.exists) {
        _setState(_state.copyWith(user: UserModel.fromFirestore(doc)));
      }
    }
  }

  Future<void> updateUserData({
    String? name,
    String? phone,
    String? profileImage,
  }) async {
    await _handleAuthOperation(() async {
      final uid = await _storage.read(key: AppConstants.storageKeyUid);
      if (uid != null) {
        Map<String, dynamic> updateData = {};
        if (name != null) updateData['name'] = name;
        if (phone != null) updateData['phone'] = phone;
        if (profileImage != null) updateData['profileImage'] = profileImage;

        if (updateData.isNotEmpty) {
          await _firestore
              .collection(AppConstants.usersCollection)
              .doc(uid)
              .update(updateData);
          await fetchUserData();
        }
      }
    });
  }

  Future<String?> uploadProfileImage(File imageFile) async {
    String? driveImageUrl;
    await _handleAuthOperation(() async {
      final uid = await _storage.read(key: AppConstants.storageKeyUid);
      if (uid == null) {
        AppLogger.error("Cannot upload profile image: UID is null");
        return;
      }

      AppLogger.info(
        "Starting profile image upload to Drive via Apps Script...",
      );

      driveImageUrl = await _firestoreService.uploadImageToDrive(imageFile);

      if (driveImageUrl != null) {
        AppLogger.info("Profile image upload successful. URL: $driveImageUrl");
      } else {
        AppLogger.error("Profile image upload failed via Apps Script.");
      }
    });
    return driveImageUrl;
  }

  Future<void> checkLoginStatus() async {
    _setState(_state.copyWith(status: AuthStatus.loading));
    try {
      final login = await _storage.read(key: AppConstants.storageKeyLogin);
      final uid = await _storage.read(key: AppConstants.storageKeyUid);
      if (login == 'true' && uid != null) {
        await fetchUserData();
        _setState(_state.copyWith(status: AuthStatus.success));
      } else {
        _setState(_state.copyWith(status: AuthStatus.initial));
      }
    } catch (e) {
      _setState(
        _state.copyWith(
          status: AuthStatus.failure,
          fallbackMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> updateEmailInFirestore(String newEmail) async {
    await _handleAuthOperation(() async {
      final uid = await _storage.read(key: AppConstants.storageKeyUid);
      if (uid != null) {
        await _firestore
            .collection(AppConstants.usersCollection)
            .doc(uid)
            .update({'email': newEmail});
        await fetchUserData();
      }
    });
  }

  Future<void> resetState() async {
    _setState(const AuthState(status: AuthStatus.initial));
  }
}
