import 'package:flutter/material.dart';
import 'package:note/utils/resources/color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight,
    {String fontFamily = FontConstants.nunito}) {
  return TextStyle(
      fontSize: fontSize, fontFamily: fontFamily, fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s16,
  Color color = ColorManager.black,
  String fonFamily = FontConstants.nunito,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular,
      fontFamily: fonFamily);
}

// medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s16,
  // Color color = ColorManager.black,
  String fonFamily = FontConstants.nunito,
}) {
  return _getTextStyle(fontSize, FontWeightManager.medium,
      fontFamily: fonFamily);
}

// medium style

TextStyle getLightStyle({
  double fontSize = FontSize.s16,
  required Color color,
  String fonFamily = FontConstants.nunito,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light,
      fontFamily: fonFamily);
}

// bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s40,
  String fonFamily = FontConstants.nunito,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    fontFamily: fonFamily,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s16,
  Color color = ColorManager.black,
  String fonFamily = FontConstants.nunito,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold,
      fontFamily: fonFamily);
}
