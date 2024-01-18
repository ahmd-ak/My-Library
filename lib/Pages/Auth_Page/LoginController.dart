import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Home_Page/HomeScreen.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';

class LoginController extends GetxController {
  //tool responsible for state management

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUpWithEmailAndPassword() async {
    //copy paste firebase for flutter
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User signed up: ${userCredential.user!.uid}');
      Get.off(() => const HomeScreen());
    } catch (e) {
      print('Error signing up: $e');
      Get.snackbar('Signup Error', 'Failed to create an account',
          backgroundColor: Colors.white);
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('User signed in: ${userCredential.user!.uid}');
      Get.off(() => const HomeScreen());
    } catch (e) {
      print('Error signing in: $e');
      Get.snackbar('Login Error', 'Invalid email or password',
          backgroundColor: Colors.white);
    }
  }

  void navigateToSignUp() {
    emailController.clear();
    passwordController.clear();
    Get.off(() => const SignUpScreen());
  }

  void navigateToSignIn() {
    emailController.clear();
    passwordController.clear();
    Get.off(() => const LoginScreen());
  }
}
