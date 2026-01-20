import 'package:get/get.dart';
import 'package:live_streaming_app/features/auth/login/view/login_screen.dart';
import 'package:live_streaming_app/features/auth/register/view/register_screen.dart';
import 'package:live_streaming_app/features/splash/view/splash_screen.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String register = '/register';
  static const String login = '/login';



  // Get routes here.......
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: ()=> SplashScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: login,
      page: ()=> LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: register,
      page: ()=> RegisterScreen(),
      transition: Transition.leftToRight,
    ),

  ];
}