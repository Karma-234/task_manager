import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/text_styles.dart';

class TaskAction extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback? onPress;
  const TaskAction({
    super.key,
    this.color = Colors.red,
    this.text = 'Delete',
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextstyles.bodyLarge(),
          ),
        ),
      ),
    );
  }
}
