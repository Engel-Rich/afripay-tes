import 'package:flutter/material.dart';

class SizeConfig {
  static late Size _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

// late Size size => MediaQueryData.fromView(View.of(context)).size;

  late double wv;
  late double hv;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.sizeOf(context);
    screenWidth = _mediaQueryData.width;
    screenHeight = _mediaQueryData.height;
    wv = screenWidth / 100;
    hv = screenHeight / 100;
    orientation = MediaQuery.orientationOf(context);
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 844 is the layout height that designer use
  return (inputHeight / 844.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 390 is the layout width that designer use
  return (inputWidth / 390.0) * screenWidth;
}

extension SizeExtension on num {
  double get w => getProportionateScreenWidth(toDouble());
  double get h => getProportionateScreenHeight(toDouble());
}

SizedBox spacerHeight(int height) => SizedBox(height: height.h);
SizedBox spacerWidth(int width) => SizedBox(width: width.w);
