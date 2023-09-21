import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringExtension on String {
  String get png => "assets/images/pngs/$this.png";
  String get svg => "assets/images/svgs/$this.svg";
  String get gif => "assets/images/gifs/$this.gif";
  String get json => "assets/images/gifs/$this.json";
}

extension WidgetExtension on Widget {
  addPadding({double padding = 0, EdgeInsetsGeometry? customPadding}) =>
      Padding(
        padding: customPadding ?? EdgeInsets.all(padding.r),
        child: this,
      );
}

extension IterableSeparator<T> on List<Widget> {
  List<Widget> separateWith(Widget separator) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element) => [...r, separator, element],
        );
  addPadding({double padding = 0, EdgeInsetsGeometry? customPadding}) =>
      map((e) => e.addPadding(padding: padding, customPadding: customPadding)
          as Widget).toList();
}
