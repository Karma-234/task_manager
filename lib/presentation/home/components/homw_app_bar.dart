import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/routes/app_router.gr.dart';
import 'package:task_manager/core/services/auth/auth_service.dart';

import '../../../core/theme/text_styles.dart';
import '../../../core/theme/colors.dart';
import '../../../state/user_state.dart';

class HomeAppBar extends StatelessWidget {
  final VoidCallback? onLogout;
  const HomeAppBar({
    super.key,
    required this.state,
    this.onLogout,
  });

  final UserState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Spacer(),
        20.horizontalSpace,
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Hi\n',
              children: [
                TextSpan(
                  text: '${state.userName} 📝',
                  style: const TextStyle(color: AppColors.p3),
                )
              ],
            ),
            textAlign: TextAlign.center,
            style: AppTextstyles.xLarge(fontSize: 34, textHeight: 39),
          ),
        ),
        20.horizontalSpace,
        IconButton(
          onPressed: () {
            onLogout!();
            final state = User.of(context);
            final auth = AuthService();
            context.router.pushAndPopUntil(const LoginRoute(),
                predicate: (route) => true, scopedPopUntil: true);
            state.setUserName('');
            state.setPassword('');
            auth.logout();
          },
          icon: Icon(
            Icons.logout,
            size: 30.sp,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
