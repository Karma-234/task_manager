import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/text_styles.dart';
import '../core/theme/colors.dart';
import 'buttons/task_action.dart';
import 'container/gradient_container.dart';

class TodoCard extends StatelessWidget {
  final VoidCallback? markDone;
  final VoidCallback? delete;
  final String? title;
  final String? description;
  final bool isDone;

  const TodoCard({
    super.key,
    this.markDone,
    this.delete,
    this.title,
    this.description,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBorderContainer(
      borderGradient: const LinearGradient(
        colors: [AppColors.p2, AppColors.p4],
      ),
      innerPadding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title ?? 'No title',
                  style: AppTextstyles.large(),
                ),
              ),
              16.verticalSpace,
              if (isDone)
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24.sp,
                )
            ],
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  description ?? 'No description',
                  style: AppTextstyles.bodyLarge(),
                ),
              ),
              // const Spacer(),
              26.horizontalSpace,
              if (!isDone) ...[
                TaskAction(
                  text: 'Done',
                  color: Colors.greenAccent,
                  onPress: markDone,
                ),
                26.horizontalSpace,
                TaskAction(
                  onPress: delete,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
