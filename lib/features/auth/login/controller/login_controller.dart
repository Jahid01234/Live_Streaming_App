import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  // ✅ Sign In Method........................
  Future<void> signInUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!GetUtils.isEmail(email)) {
      EasyLoading.showError("Enter a valid email");
      return;
    }

    if (password.length < 8) {
      EasyLoading.showError("Password must be at least 8 characters");
      return;
    }

    try {
      EasyLoading.show(status: "Loading...");

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

        final docSnapshot = await userDocRef.get();

        if (!docSnapshot.exists) {
          EasyLoading.dismiss();
          EasyLoading.showError("User info not found. Please sign up first.");
          //Get.offAllNamed(AppRoutes.register);
          return;
        }
        // ✅ Successful login
        EasyLoading.showSuccess("Login successful!");

        // clear fields
        emailController.clear();
        passwordController.clear();

        // 👉 Go to home
        //Get.to(()=> BottomNavBarScreen());
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      if (e.code == 'wrong-password') {
        EasyLoading.showError("Wrong password provided.");
      } else if (e.code == 'user-not-found') {
        EasyLoading.showError("No user found for this email.");
      } else if (e.code == "network-request-failed") {
        EasyLoading.showError("No internet connection.");
      } else if (e.code == 'invalid-credential') {
        EasyLoading.showError("Invalid email or password. Please try again.");
      } else {
        EasyLoading.showError(e.message ?? "Login failed.");
      }

    } catch (e) {
      EasyLoading.dismiss();
    }
  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}