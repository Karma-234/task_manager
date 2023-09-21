import 'package:flutter/material.dart';

import '../core/theme/text_styles.dart';
import '../core/utils/colors.dart';
import '../state/user_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.state,
  });

  final UserState state;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }
}
