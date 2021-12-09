import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get onAuthChanged {
    return firebaseAuth.authStateChanges();
  }

  User? currentUser() {
    return firebaseAuth.currentUser;
  }

  Future<User?> signInAnonymously() async {
    final authResult = await firebaseAuth.signInAnonymously();
    print("anonymous user: " + authResult.user!.uid);
    return authResult.user;
  }

  Future<User?> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      print(googleAccount.toString());
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        return authResult.user;
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  Future<User?> signInWithEmail() async {
    final authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: "email", password: "password");
    return authResult.user;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }
}
