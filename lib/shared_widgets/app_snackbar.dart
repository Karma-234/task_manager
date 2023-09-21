import 'package:flutter/material.dart';

import '../core/theme/text_styles.dart';

appSnackBar(BuildContext context, {String? tetx}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      tetx.toString(),
      style: AppTextstyles.bodyLarge(),
    )));
