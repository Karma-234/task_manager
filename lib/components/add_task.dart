import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/text_styles.dart';
import '../core/utils/colors.dart';
import '../shared_widgets/app_input_field.dart';
import '../shared_widgets/buttons/primary_button.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.symmetric(horizontal: 26.w, vertical: 100.h),
      child: Material(
        color: AppColors.p1,
        type: MaterialType.card,
        borderRadius: BorderRadius.circular(8.r),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: CloseButton(
                  color: Colors.white,
                ),
              ),
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: AppTextstyles.large(),
              ),
              16.verticalSpace,
              const AppInputField(
                hint: 'Enter title',
                labeltext: 'Title',
              ),
              16.verticalSpace,
              const AppInputField(
                hint: 'Enter description',
                labeltext: 'Description',
              ),
              24.verticalSpace,
              const Align(
                child: AppPrimaryButton(
                  buttonWidth: 100,
                  buttonHeight: 43,
                  text: 'Add task',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
