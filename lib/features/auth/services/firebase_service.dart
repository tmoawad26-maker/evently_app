import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/constants/friebase_constants.dart';
import 'package:evently_app/core/errors/firebase_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/app_user.dart';

class FirebaseService {
  /// handle authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFailure _firebaseFailure = FirebaseFailure();

  /// create userCollection
  CollectionReference<AppUser> userCollection() {
    return FirebaseFirestore.instance
        .collection(FirebaseConstants.userCollection)
        .withConverter<AppUser>(
          fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  Future<AppUser> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = AppUser(
        id: userCredential.user!.uid,
        email: email,
        name: name,
      );

      /// add user in user collection
      userCollection().doc(user.id).set(user);
      return user;
    } on FirebaseAuthException catch (e) {
      throw Exception(
        _firebaseFailure.getFirebaseAuthErrorMessage(e),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<AppUser?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final snapshots = await userCollection().doc(credential.user?.uid).get();
      return snapshots.data();
    } on FirebaseAuthException catch (e) {
      throw Exception(
        _firebaseFailure.getFirebaseAuthErrorMessage(e),
      );
    }
  }
   Future<void> resetPassword({required String email}) async {
      try {
        await  _firebaseAuth.sendPasswordResetEmail(email: email);
      }on FirebaseAuthException catch (e) {
        throw Exception(
          _firebaseFailure.getFirebaseAuthErrorMessage(e),
        );
      }
    }
}
