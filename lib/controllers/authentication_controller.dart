import 'package:edu_care/views/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rx<User?> currentUser = Rx<User?>(null).obs.value;

  @override
  void onInit() {
    super.onInit();
    _setInitialAuthState();
  }

  void _setInitialAuthState() {
    currentUser.value = _firebaseAuth.currentUser;
  }

  Future<void> signIn(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      currentUser.value = userCredential.user;
      Get.snackbar(
        'Success',
        'Sign-in successful!',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(DashboardPage());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Sign-in failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _firebaseAuth.signOut();
      currentUser.value = null;
    } catch (e) {
      // Handle sign-out error
      debugPrint('Sign-out error: $e');
    }
  }
}
