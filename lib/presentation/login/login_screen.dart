import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/presentation/login/components/login_form.dart';
import 'package:task_manager/core/routes/app_router.gr.dart';
import 'package:task_manager/core/services/auth/auth_service.dart';
import 'package:task_manager/core/theme/text_styles.dart';
import 'package:task_manager/core/utils/colors.dart';
import 'package:task_manager/shared_widgets/app_modal.dart';
import 'package:task_manager/shared_widgets/app_snackbar.dart';
import 'package:task_manager/shared_widgets/buttons/primary_button.dart';

import '../../state/user_state.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final Animation<double> scale;
  late final Animation<double> offset;
  late final AnimationController ctrl;
  late final AnimationController ctrl2;
  @override
  void initState() {
    super.initState();
    ctrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    ctrl2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    scale = Tween<double>(begin: 0.0, end: 1.0).animate(ctrl);
    offset = Tween<double>(begin: 0, end: 1).animate(ctrl2);
    ctrl2.forward().then((value) => ctrl.forward());
  }

  @override
  void dispose() {
    ctrl.dispose();
    ctrl2.dispose();
    super.dispose();
  }

  late final GlobalKey<FormState> formKey = GlobalKey();
  late final state = User.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.p1,
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.userName.isNotEmpty)
              Text(
                'Username: ${state.userName}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            12.verticalSpace,
            30.verticalSpace,
            FadeTransition(
              opacity: offset,
              child: Text.rich(
                const TextSpan(text: 'Hi,', children: [
                  TextSpan(
                    text: 'welcome',
                    style: TextStyle(color: AppColors.p3),
                  ),
                  TextSpan(text: '\nTo'),
                ]),
                textAlign: TextAlign.center,
                style: AppTextstyles.xLarge(),
              ),
            ),
            ScaleTransition(
              scale: scale,
              child: Text(
                'Task Manager',
                textAlign: TextAlign.center,
                style: AppTextstyles.xLarge(
                    fontSize: 34, textHeight: 39, textColor: AppColors.p2),
              ),
            ),
            26.verticalSpace,
            LoginForm(stateKey: formKey),
            24.verticalSpace,
            state.isLoading
                ? CupertinoActivityIndicator(
                    color: AppColors.p3,
                    radius: 30.r,
                  )
                : AppPrimaryButton(
                    text: 'Login',
                    onPress: () {
                      if (formKey.currentState?.validate() ?? false) {
                        _performLogin(context);
                      } else {
                        return;
                      }
                    },
                  )
          ],
        ),
      ),
    );
  }

  void _performLogin(BuildContext context) {
    final user = User.of(context);
    try {
      state.setLoading(true);
      late final auth = AuthService();
      auth
          .signInWithEmailandPassword(
              username: user.userName, password: user.password)
          .then((value) {
        state.setLoading(false);
        if (value != null) {
          state.setUid(value.user?.uid);
          appModal(
            context,
            onPress: () => context.router.pushAndPopUntil(const HomeRoute(),
                predicate: (route) => false),
          );
        } else {
          appSnackBar(context, tetx: 'Invalid login details');
        }
      });
    } catch (e) {
      state.setLoading(false);
      appSnackBar(context, tetx: e.toString());
    }
  }
}
