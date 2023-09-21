import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/theme/text_styles.dart';
import 'package:task_manager/shared_widgets/buttons/primary_button.dart';

appModal(BuildContext context,
        {String header = 'Success',
        VoidCallback? onPress,
        String message = 'Login successful',
        String buttonText = 'Continue'}) =>
    showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: false,
      enableDrag: false,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.r),
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              header,
              style: AppTextstyles.xLarge(textColor: Colors.black),
            ),
            24.verticalSpace,
            Text(
              message,
              style: AppTextstyles.bodyLarge(textColor: Colors.black),
            ),
            28.verticalSpace,
            AppPrimaryButton(
              onPress: onPress,
              text: buttonText,
              buttonWidth: 100,
              buttonHeight: 40,
            )
          ],
        ),
      ),
    );
