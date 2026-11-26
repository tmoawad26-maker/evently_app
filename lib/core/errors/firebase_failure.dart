import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFailure {
  String getFirebaseAuthErrorMessage(FirebaseAuthException e) {
    return switch (e.code) {
      'invalid-credential' => 'Invalid email or password. Please try again.',
      'invalid-email' => 'Please enter a valid email address.',
      'user-disabled' => 'This account has been disabled. Contact support.',
      'user-not-found' => 'No account found with this email.',
      'wrong-password' => 'Incorrect password. Please try again.',
      'email-already-in-use' => 'An account already exists with this email.',
      'weak-password' => 'Your password is too weak. Use at least 6 characters.',
      'operation-not-allowed' => 'This sign-in method is currently disabled.',
      'too-many-requests' => 'Too many failed attempts. Please try again later.',
      'network-request-failed' => 'Network error. Check your internet connection.',
      'requires-recent-login' => 'Please log out and log back in before making this change.',
      _ => 'An authentication error occurred. Please try again.',
    };
  }
}
