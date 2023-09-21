import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/utils/colors.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final Gradient borderGradient;
  final EdgeInsetsGeometry padding;
  final Color innerColor;
  final double? height;
  final EdgeInsetsGeometry innerPadding;

  const GradientBorderContainer({
    super.key,
    required this.child,
    this.borderWidth = 2.0,
    this.borderRadius = 8.0,
    required this.borderGradient,
    this.padding = const EdgeInsets.all(3.0),
    this.innerColor = AppColors.p1,
    this.innerPadding = const EdgeInsets.all(3.0),
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: borderGradient,
      ),
      padding: padding,
      child: Container(
        padding: innerPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius - borderWidth),
          color: innerColor, // You can set the inner container color as needed
        ),
        child: child,
      ),
    );
  }
}
