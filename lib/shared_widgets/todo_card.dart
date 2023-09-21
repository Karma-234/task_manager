import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/text_styles.dart';
import '../core/utils/colors.dart';
import 'buttons/task_action.dart';
import 'container/gradient_container.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
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
                  'Title gfufhcvhgcjhgfjhghgjhgfhffhhhggvgg',
                  style: AppTextstyles.large(),
                ),
              ),
              16.verticalSpace,
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
                  'Desc',
                  style: AppTextstyles.bodyLarge(),
                ),
              ),
              // const Spacer(),
              26.horizontalSpace,
              const TaskAction(
                text: 'Done',
                color: Colors.greenAccent,
              ),
              26.horizontalSpace,
              const TaskAction(),
            ],
          ),
        ],
      ),
    );
  }
}
