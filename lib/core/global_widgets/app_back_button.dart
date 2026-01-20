import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final double height;
  final double width;
  final Color bgColor;
  final double radius;
  final VoidCallback? onTap;

  const AppBackButton({
    super.key,
    this.icon = Icons.arrow_back_ios_rounded,
    this.iconSize = 20,
    this.iconColor = Colors.black,
    this.height = 40,
    this.width = 40,
    this.bgColor = const Color.fromARGB(50, 158, 158, 158),
    this.radius = 12,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor,
        ),
        child: Center(
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}