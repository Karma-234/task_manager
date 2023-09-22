import 'package:flutter/material.dart';

import '../core/theme/text_styles.dart';

class TodoInformationWidget extends StatelessWidget {
  final String text;
  const TodoInformationWidget({
    super.key,
    this.text = 'Error getting tasks!',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: AppTextstyles.large(),
      ),
    );
  }
}
