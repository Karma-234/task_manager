// ignore_for_file: unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailandPassword(
      {required String username, required String password}) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: '$username@task.com', password: password);
      return cred;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  logout() async => await _auth.signOut();
}
