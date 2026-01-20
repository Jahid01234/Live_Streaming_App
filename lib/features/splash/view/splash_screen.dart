import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_streaming_app/core/style/global_text_style.dart';
import 'package:live_streaming_app/features/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.videocam,
              color: Colors.teal.shade400,
              size: 70,
            ),
            Text(
              "Live Streaming App",
              style: globalTextStyle(
                fontSize: 22,
                color: Colors.teal,
                fontWeight: FontWeight.w700
              ),
            )
          ],
        ),
      ),
    );
  }
}