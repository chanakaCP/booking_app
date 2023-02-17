import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../containers/custom_container.dart';
import '../text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final double? buttonWidth;
  final double buttonHeight;
  final BorderRadius? radius;
  final double borderWidth;
  final Color bgColor;
  final Color? iconColor;
  final Color borderColor;
  final Color contentColor;
  final Color splashColor;
  final Color disableBackgroundColor;
  final Color disableContentColor;
  final Color disableBorderColor;
  final BorderStyle borderStyle;
  final TextStyle? textStyle;
  final double? contentPadding;
  final bool isDissable;
  final EdgeInsetsGeometry? margin;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.onLongPress,
    this.marginTop = 0,
    this.marginBottom = 0,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.buttonWidth,
    this.buttonHeight = 48.0,
    this.radius,
    this.textStyle,
    this.contentPadding,
    this.borderStyle = BorderStyle.none,
    this.contentColor = white,
    this.borderWidth = 0,
    this.borderColor = transparent,
    this.bgColor = black,
    this.splashColor = black,
    this.disableBackgroundColor = black,
    this.disableContentColor = black,
    this.disableBorderColor = transparent,
    this.isDissable = false,
    this.iconColor,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          EdgeInsets.only(
            left: marginLeft,
            bottom: marginBottom,
            right: marginRight,
            top: marginTop,
          ),
      child: Material(
        borderRadius: radius ?? BorderRadius.circular(10),
        elevation: bgColor == Colors.transparent ? 0 : 0.4,
        color: isDissable ? disableBackgroundColor : bgColor,
        child: InkWell(
          borderRadius: radius ?? BorderRadius.circular(10),
          splashColor: splashColor,
          focusColor: splashColor,
          highlightColor: splashColor,
          hoverColor: splashColor,
          onTap: () async {
            if (isDissable == false) {
              onPressed();
            }
          },
          onLongPress: () {
            if (onLongPress != null && isDissable == false) {
              onLongPress!();
            }
          },
          child: CustomContainer(
            width: buttonWidth ?? double.infinity,
            height: buttonHeight,
            border: Border.all(
              width: borderWidth,
              color: borderColor,
              style: borderStyle,
            ),
            borderRadius: radius ?? BorderRadius.circular(10),
            child: Center(
              child: CustomText(
                containerAlignment: Alignment.center,
                text: text,
                textStyle: textStyle ?? buttonTextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
