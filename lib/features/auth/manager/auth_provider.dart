import 'package:evently_app/features/auth/services/firebase_service.dart';
import 'package:evently_app/features/auth/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this.firebaseService);

  final FirebaseService firebaseService;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  bool isLoading = false;

  Future<AppUser?> register(
    String email,
    String password,
    String name,
  ) async {
    isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      return await firebaseService.signUp(
        email: email,
        password: password,
        name: name,
      );
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      return null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signIn(
    String email,
    String password,
  ) async {
    isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await firebaseService.signIn(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> resetPassword({required String email}) async {
    isLoading = true;
    notifyListeners();
    try {
     await  firebaseService.resetPassword(email: email);
    }  catch(e){
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    }
    isLoading = false;
    notifyListeners();
  }
}
