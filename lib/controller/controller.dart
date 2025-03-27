import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home.dart';
import '../signin/signin_page.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User?> user = Rx<User?>(null);
  RxBool isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(email);
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (!isValidEmail(email)) {
      Get.snackbar("Error", "Invalid email format");
      return;
    }

    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      // Save login state
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);

      Get.offAll(Home());
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", _getFirebaseErrorMessage(e));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signup() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (!isValidEmail(email)) {
      Get.snackbar("Error", "Invalid email format");
      return;
    }

    if (password.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters");
      return;
    }

    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.back();
      Get.snackbar("Success", "Account created successfully");
    } catch (e) {
      Get.snackbar("Error", _getFirebaseErrorMessage(e));
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await auth.signOut();
    Get.offAll(() => SignInPage());
  }

  Future<void> resetPassword() async {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Error", "Email is required");
      return;
    }
    if (!isValidEmail(email)) {
      Get.snackbar("Error", "Invalid email format");
      return;
    }

    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent");
    } catch (e) {
      Get.snackbar("Error", _getFirebaseErrorMessage(e));
    } finally {
      isLoading.value = false;
    }
  }

  String _getFirebaseErrorMessage(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          return "No user found for that email.";
        case 'wrong-password':
          return "Incorrect password.";
        case 'email-already-in-use':
          return "Email is already registered.";
        case 'weak-password':
          return "Password is too weak.";
        default:
          return e.message ?? "An unexpected error occurred.";
      }
    }
    return "An unexpected error occurred.";
  }
}
