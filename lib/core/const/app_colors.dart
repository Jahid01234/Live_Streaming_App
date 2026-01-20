import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor1 = Color(0xff92A3FD);
  static const Color primaryColor2 = Color(0xff9DCEFF);
  static const Color secondaryColor1 = Color(0xffC58BF2);
  static const Color secondaryColor2 = Color(0xffEEA4CE);
  static const Color greenColor = Color(0xff53E88B);
  static const Color lightGreenColor = Color(0xff15BE77);
  static const Color textFieldColor = Color(0xffADA4A5);
  static const Color black = Color(0xff1D1617);
  static const Color gray = Color(0xff786F72);
  static const Color white = Colors.white;
  static const Color lightGray = Color(0xffF7F8F8);


  static const LinearGradient appGradient1 = LinearGradient(
    colors: [
      primaryColor2,
      primaryColor1
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient appGradient2 = LinearGradient(
    colors: [
      secondaryColor2,
      secondaryColor1
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );





}