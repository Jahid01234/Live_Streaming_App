import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_streaming_app/core/const/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;
  final double? radius;
  final Color? bgColor;
  final Color? border;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.bgColor,
    this.border,
    this.textColor,
    this.radius,
    this.fontSize,
    this.height,
    this.width,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height ?? 60,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 30),
            color: bgColor,
            gradient: bgColor == null ? AppColors.appGradient1 : null,
            border: border != null
                ? Border.all(color: border!)
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    color: textColor ?? AppColors.black,
                  ),
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 5),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: icon),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}