import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle customFontStyle({
  Color? fontColor = black,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 12.0,
  double fontHeight = 12.0,
  double letterSpace = 0,
}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
      height: fontHeight / fontSize,
      letterSpacing: letterSpace,
    );

TextStyle bottomNavbarFontStyle({Color? fontColor = gray}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: fontColor,
    );

TextStyle buttonTextStyle({Color? fontColor = white}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: fontColor,
    );

TextStyle defaultLableStyle({
  Color? fontColor = black,
  double fontSize = 17.0,
  FontWeight fontWeight = FontWeight.w600,
}) =>
    TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: fontColor,
    );

TextStyle hintStyle({Color? fontColor = gray}) => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13.0,
      color: fontColor,
    );

TextStyle inputStyle({Color? fontColor = black}) => TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13.0,
      color: fontColor,
    );

TextStyle errorLableStyle({Color? fontColor = red}) => TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10.0,
      color: fontColor,
    );

TextStyle dateLableStyle({Color? fontColor = black}) => TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: fontColor,
    );
