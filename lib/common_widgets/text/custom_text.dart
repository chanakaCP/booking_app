import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Alignment containerAlignment;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final EdgeInsetsGeometry? margin;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final TextAlign textAlign;
  final int? maxLines;
  final TextStyle? textStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? lineHeight;
  final TextDecoration? textDecoration;
  final TextOverflow? overflow;
  final TextDirection? textDirection;

  const CustomText({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.containerAlignment = Alignment.centerLeft,
    this.textColor = black,
    this.textStyle,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.letterSpacing,
    this.textDecoration,
    this.overflow,
    this.wordSpacing,
    this.textDirection,
    this.lineHeight,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin ??
          EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: marginBottom,
          ),
      alignment: containerAlignment,
      child: Text(
        text,
        textAlign: textAlign,
        textWidthBasis: TextWidthBasis.parent,
        overflow: overflow ?? TextOverflow.visible,
        maxLines: maxLines,
        textDirection: textDirection,
        style: textStyle ??
            TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
              height: lineHeight,
              decoration: textDecoration,
              overflow: overflow,
            ),
      ),
    );
  }
}
