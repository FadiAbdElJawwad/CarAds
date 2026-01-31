import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> loginUser(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<UserCredential> signUpUser(
      {required String email, required String password}) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(
      {required String email,}) async {
    return await _auth.sendPasswordResetEmail(
     email: email.trim(),
    );
  }
}
