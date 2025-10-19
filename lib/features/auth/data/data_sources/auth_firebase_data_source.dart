import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebaseDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  AuthFirebaseDataSource({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  Future<void> signupWithEmail(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('This email is already registered.');
      } else if (e.code == 'weak-password') {
        throw Exception('The password is too weak.');
      } else {
        throw Exception(e.message ?? 'Signup failed.');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for this email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Incorrect password.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Invalid email format.');
      } else {
        throw Exception(e.message ?? 'Login failed.');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<String> forgetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return 'Password reset email has been sent. Please check your inbox.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'This email is not registered. Please sign up first.';
      } else {
        return e.message ?? 'Failed to send reset email.';
      }
    } catch (e) {
      return 'Unexpected error: $e';
    }
  }


  Future<User?> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );

      return userCredential.user;
    } catch (e) {
      throw Exception('Google login failed: $e');
    }
  }
}
