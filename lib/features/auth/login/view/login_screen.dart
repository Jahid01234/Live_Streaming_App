import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/const/app_colors.dart';
import 'package:live_streaming_app/core/const/app_size.dart';
import 'package:live_streaming_app/core/global_widgets/app_primary_button.dart';
import 'package:live_streaming_app/core/global_widgets/custom_text_field.dart';
import 'package:live_streaming_app/core/routes/routes.dart';
import 'package:live_streaming_app/core/style/global_text_style.dart';
import 'package:live_streaming_app/features/auth/login/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(200)),
              Center(
                child: Text(
                    "Login",
                    style: globalTextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                ),
              ),
              SizedBox(height: getHeight(40)),
              CustomTextField(
                controller: controller.emailController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.email_outlined,color: Colors.grey)
                ),
                hinText: "Email",
              ),
              SizedBox(height: getHeight(20)),
              Obx(
                    () => CustomTextField(
                  obsecureText: controller.isPasswordHidden.value,
                  controller: controller.passwordController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.lock_open,color: Colors.grey)
                  ),
                  hinText: "Password",
                  suffixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getHeight(80)),
              AppPrimaryButton(
                text: "Login",
                textColor: AppColors.white,
                onTap: () {
                  controller.signInUser();
                },
              ),
              SizedBox(height: getHeight(60)),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don’t have an account yet? ",
                    style: globalTextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: globalTextStyle(
                          fontSize: 15,
                          color: AppColors.secondaryColor1,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                             Get.toNamed(AppRoutes.register);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}