import 'package:flutter/material.dart';

class ColorManager {
  static const Color primaryGreen = Color(0xFF6BF5DE);
  static const Color teal = Color(0xFF287D6F);
  static const Color blue = Color(0xFF0074E1);
  static const Color red = Color(0xFFAC0000);
  static const Color transparent = Colors.transparent;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color bgColor = Color(0xFF252525);
  static const Color grey = Color(0xffBDBDBD);
  static const Color lightBlack = Color(0xff3B3B3B);
  static const Color darkGrey = Color(0xff505050);
  static const Color lightPurple = Color(0xffFE99FF);
  static const Color lightRed = Color(0xffFE9E9F);
  static const Color lightBlue = Color(0xff9FFFFE);
  static const Color lightGreen = Color(0xff92F48F);
  static const Color lightYellow = Color(0xffFFF699);

  static const lightLinearGradient = LinearGradient(
    colors: <Color>[ColorManager.blue, ColorManager.teal],
  );
  static const darkLinearGradient = LinearGradient(
    colors: <Color>[ColorManager.blue, ColorManager.primaryGreen],
  );
}
