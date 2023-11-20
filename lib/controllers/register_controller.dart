// ignore_for_file: unused_local_variable

import 'package:edu_care/views/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edu_care/controllers/country_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final CountryController countryController = Get.put(CountryController());
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _phoneNumber; // Store the phoneNumber as a class-level variable

  Future<void> registerUser() async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(emailController.text)
          .set({
        'User Name': userNameController.text,
        'Name': nameController.text,
        'Email': emailController.text,
        'Phone Number': _phoneNumber,
      });
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to register user: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUp() async {
    try {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the selected country code and phone number
      _phoneNumber = countryController.selectedCountry.value!.code +
          phoneNumberController.text.trim();

      registerUser();

      // Clear form fields after successful sign-up
      nameController.clear();
      userNameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      phoneNumberController.clear();

      Get.snackbar(
        'Success',
        'Sign-up successful!',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.to(DashboardPage());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Sign-up failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    // Clean up resources
    nameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }
}
