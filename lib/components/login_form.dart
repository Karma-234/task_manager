import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/shared_widgets/app_input_field.dart';
import 'package:task_manager/state/user_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    this.stateKey,
  });
  final GlobalKey<FormState>? stateKey;

  @override
  Widget build(BuildContext context) {
    late final state = User.of(context);
    return Form(
        key: stateKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppInputField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r"\s"))
              ],
              validator: (p0) {
                if (state.userName.isEmpty) {
                  return 'Username cannot be empty';
                }
                if (state.userName.length < 8) {
                  return 'Username must not be less than 8 characters';
                }
                if (!state.userName.contains(RegExp('[A-Za-z]'))) {
                  return 'Username must contain at least one letter';
                }
                return null;
              },
              onChanged: (v) {
                state.setUserName(v.trim());
                state.shouldNotifyListeners();
              },
            ),
            16.verticalSpace,
            AppInputField(
              obscure: true,
              hint: 'Enter Password',
              labeltext: 'Password',
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r"\s"))
              ],
              validator: (p0) {
                if (state.password.isEmpty) {
                  return 'Password cannot be empty';
                }
                if (state.password.length < 8) {
                  return 'Password must not be less than 8 characters';
                }
                return null;
              },
              onChanged: (v) {
                state.setPassword(v.trim());
                state.shouldNotifyListeners();
              },
            ),
          ],
        ));
  }
}
