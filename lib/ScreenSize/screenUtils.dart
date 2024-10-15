import 'package:flutter/material.dart';

class ScreenUtils {
  final BuildContext context;
  final double width;
  final double height;
  final bool isPortrait;

  ScreenUtils(this.context)
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height,
        isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  /// Returns the width as a fraction of the screen width
  double w(double fraction) => width * fraction;

  /// Returns the height as a fraction of the screen height
  double h(double fraction) => height * fraction;

  /// Returns the font size as a fraction of the screen width
  double sp(double fraction) => width * fraction;

  /// Returns true if the device is considered a tablet (based on width)
  bool get isTablet => width >= 600;



}