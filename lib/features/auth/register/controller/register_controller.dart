import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/routes/routes.dart';
import 'package:live_streaming_app/features/live_streaming/model/user_model.dart';

class RegisterController extends GetxController{

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }



  // sign up method........
  Future<void> createAccount() async {
    final userName = userNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;

    // 🔐 VALIDATION
    if (userName.isEmpty) {
      EasyLoading.showError("Please enter user name.");
      return;
    }

    if (!GetUtils.isEmail(email)) {
      EasyLoading.showError("Please enter a valid email.");
      return;
    }

    if (password.length < 8) {
      EasyLoading.showError("Password must be at least 8 characters.");
      return;
    }


    try {
      EasyLoading.show(status: "Loading...");

      final UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      if (user != null) {

        final userModel = UserModel(
          uid: user.uid,
          userName: userName,
          email: email,
          profileImage: '',
          createdAt: DateTime.now(),
        );

        // ✅ Save user info to Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(userModel.toMap());

        EasyLoading.showSuccess("User created & saved successfully!");
        // Go to create bio screen......
        Get.toNamed(AppRoutes.login);


        userNameController.clear();
        emailController.clear();
        passwordController.clear();
      }
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      if (e.code == "weak-password") {
        EasyLoading.showError("The password provided is too weak!");
      } else if (e.code == "email-already-in-use") {
        EasyLoading.showError("The account already exists for that email!");
      } else if (e.code == "network-request-failed") {
        EasyLoading.showError("No internet connection!");
      } else {
        EasyLoading.showError(e.message ?? "Something went wrong!");
      }
    } catch (e) {
      EasyLoading.dismiss();
    }
  }




  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}