// Extension for setting height and width
import 'package:flutter/material.dart';

extension SizeExtension on Widget {
  Widget withHeight(double height) => SizedBox(
        height: height,
        child: this,
      );

  Widget withWidth(double width) => SizedBox(
        width: width,
        child: this,
      );

  Widget withSize({double? width, double? height}) => SizedBox(
        width: width,
        height: height,
        child: this,
      );
}