import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/theme/text_styles.dart';
import '../../core/theme/colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final Gradient? gradient;
  final double textSize;
  final double textHeight;
  final double buttonHeight;
  final double buttonWidth;
  final String text;
  final VoidCallback? onPress;
  final AlignmentGeometry? alignmentGeometry;
  const AppPrimaryButton({
    super.key,
    this.gradient,
    this.textSize = 16,
    this.textHeight = 20,
    this.buttonHeight = 53,
    this.buttonWidth = double.infinity,
    this.onPress,
    this.text = 'Register',
    this.alignmentGeometry,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: buttonHeight.h,
        width: buttonWidth.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          gradient: gradient ??
              const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 0.5642, 0.9999, 1.0],
                colors: [
                  AppColors.p2,
                  AppColors.p3,
                  AppColors.p4,
                  AppColors.p5,
                ],
              ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextstyles.titleMedium(
              fontSize: textSize,
              textHeight: textHeight,
              weight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
