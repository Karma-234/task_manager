import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/models/payload/add_todo.dart';
import 'package:task_manager/state/todo_state.dart';
import '../core/theme/text_styles.dart';
import '../core/utils/colors.dart';
import '../shared_widgets/app_input_field.dart';
import '../shared_widgets/buttons/primary_button.dart';

class AddTaskBody extends StatelessWidget {
  final TodoState? state;
  final bool isLoading;
  final GlobalKey<FormState> formKey;
  final Function(AddTodoPayload)? onSubmit;
  const AddTaskBody({
    super.key,
    this.state,
    this.onSubmit,
    this.isLoading = false,
    required this.formKey,
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
          child: Form(
            key: formKey,
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
                AppInputField(
                  hint: 'Enter title',
                  labeltext: 'Title',
                  validator: (p0) {
                    if ((state?.title ?? '').isEmpty) {
                      return 'Title cannot be empty!';
                    }
                    if ((state?.title ?? '').length > 50) {
                      return 'Keep title short and explain in description 🙂';
                    }
                    return null;
                  },
                  onChanged: (p0) => state?.setTitle(p0.trim()),
                ),
                16.verticalSpace,
                AppInputField(
                  hint: 'Enter description',
                  labeltext: 'Description',
                  onChanged: (p0) => state?.setDescription(p0.trim()),
                  validator: (p0) {
                    if ((state?.description ?? '').isEmpty) {
                      return 'Description cannot be empty!';
                    }
                    if ((state?.description ?? '').length > 150) {
                      return 'Keep description concise 🌚';
                    }
                    return null;
                  },
                ),
                24.verticalSpace,
                Align(
                  child: isLoading
                      ? CupertinoActivityIndicator(
                          color: AppColors.p3,
                          radius: 30.r,
                        )
                      : AppPrimaryButton(
                          buttonWidth: 100,
                          buttonHeight: 43,
                          text: 'Add task',
                          onPress: () {
                            onSubmit!(AddTodoPayload(
                                done: false,
                                description: state?.description ?? '',
                                title: state?.title ?? ''));
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
