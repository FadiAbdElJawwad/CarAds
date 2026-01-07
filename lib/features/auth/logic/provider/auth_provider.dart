import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../model/auth_state.dart';
import '../helper/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  AuthState _state = const AuthState();
  AuthState get state => _state;

  void _setState(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUpUser({
    required String name,
    required String email,
    required String password,
  }) async {
    _setState(const AuthState(status: AuthStatus.loading));
    try {
      final userCredential = await _authService.signUpUser(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
        });
      }

      await storage.write(key: 'name', value: name);
      await storage.write(key: 'login', value: 'true');

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


  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    _setState(const AuthState(status: AuthStatus.loading));

    try {
      final userCredential = await _authService.loginUser(email: email, password: password);
      String? name = email.split('@').first; // Fallback name

      if (userCredential.user != null) {
        final doc = await _firestore.collection('users').doc(userCredential.user!.uid).get();
        if (doc.exists && doc.data()!.containsKey('name')) {
          name = doc.data()!['name'];
        }
      }
      await storage.write(key: 'name', value: name);
      await storage.write(key: 'login', value: 'true');

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

  void resetState() {
    _setState(const AuthState(status: AuthStatus.initial));
  }
}
