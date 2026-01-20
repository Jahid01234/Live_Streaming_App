import 'package:get/get.dart';
import 'package:live_streaming_app/core/routes/routes.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    redirectToNextScreen();
  }


  Future<void> redirectToNextScreen()async{
    await Future.delayed( const Duration(seconds: 2));
     Get.offAllNamed(AppRoutes.login);
  }
}