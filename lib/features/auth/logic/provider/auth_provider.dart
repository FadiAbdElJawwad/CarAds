import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../model/auth_state.dart';
import '../helper/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  final FirebaseFirestore _firestore;
  final FlutterSecureStorage _storage;

  AuthProvider({
    AuthService? authService,
    FirebaseFirestore? firestore,
    FlutterSecureStorage? storage,
  })
      : _authService = authService ?? AuthService(),
        _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? const FlutterSecureStorage();

  AuthState _state = const AuthState();

  AuthState get state => _state;

  void _setState(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> _handleAuthOperation(Future<void> Function() operation) async {
    _setState(const AuthState(status: AuthStatus.loading));
    try {
      await operation();
      _setState(const AuthState(status: AuthStatus.success));
    } on FirebaseAuthException catch (e) {
      _setState(AuthState(
        status: AuthStatus.failure,
        errorKey: e.code,
        fallbackMessage: e.message,
      ));
    } catch (e) {
      _setState(AuthState(
        status: AuthStatus.failure,
        fallbackMessage: e.toString(),
      ));
    }
  }

  Future<void> _storeUserDataLocal(String uid) async {
    await _storage.write(key: 'uid', value: uid);
    await _storage.write(key: 'login', value: 'true');
  }

  Future<void> _clearUserDataLocal() async {
    await _storage.delete(key: 'uid');
    await _storage.delete(key: 'login');
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    await _handleAuthOperation(() async {
      final userCredential = await _authService.signUpUser(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'uuid': user.uid,
        });
        await _storeUserDataLocal(user.uid);
      }
    });
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    await _handleAuthOperation(() async {
      final userCredential = await _authService.loginUser(
          email: email, password: password);
      final user = userCredential.user;
      if (user != null) {
        await _storeUserDataLocal(user.uid);
      }
    });
  }

  Future<void> logout() async {
    await _handleAuthOperation(() async {
      await _authService.signOut();
      await _clearUserDataLocal();
    });
  }

  Future<void> resetPassword({required String email}) async {
    await _handleAuthOperation(() async {
      await _authService.sendPasswordResetEmail(email: email);
    });
  }

  Future<DocumentSnapshot?> getUserData() async {
    final uid = await _storage.read(key: 'uid');
    if (uid == null) return null;
    return await _firestore.collection('users').doc(uid).get();
  }

  Future<void> checkLoginStatus() async {
    _setState(const AuthState(status: AuthStatus.loading));
    try {
      final login = await _storage.read(key: 'login');
      final uid = await _storage.read(key: 'uid');
      if (login == 'true' && uid != null) {
        _setState(const AuthState(status: AuthStatus.success));
      } else {
        _setState(const AuthState(status: AuthStatus.initial));
      }
    } catch (e) {
      _setState(AuthState(
        status: AuthStatus.failure,
        fallbackMessage: e.toString(),
      ));
    }
  }

  void resetState() {
    _setState(const AuthState(status: AuthStatus.initial));
  }
}