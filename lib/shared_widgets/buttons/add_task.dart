import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback? onPress;
  const AddTaskButton({
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50.h,
        width: 50.w,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.p3,
        ),
        child: Icon(
          Icons.add,
          color: AppColors.p1,
          size: 35.sp,
        ),
      ),
    );
  }
}
