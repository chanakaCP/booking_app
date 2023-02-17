import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final double marginLeft;
  final double marginRight;
  final double marginBottom;
  final double marginTop;
  final EdgeInsetsGeometry? padding;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  final double paddingTop;
  final Alignment alignment;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final List<BoxShadow>? boxShadow;
  final BoxShape? shape;
  final DecorationImage? decorationImage;
  final Gradient? gradient;
  final Decoration? decoration;
  final BoxConstraints? constraints;

  const CustomContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
    this.margin,
    this.marginLeft = 0,
    this.marginRight = 0,
    this.marginBottom = 0,
    this.marginTop = 0,
    this.padding,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.alignment = Alignment.center,
    this.border,
    this.borderRadius,
    this.bgColor,
    this.boxShadow,
    this.shape,
    this.decorationImage,
    this.gradient,
    this.decoration,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: decoration ??
          BoxDecoration(
            border: border,
            gradient: gradient,
            borderRadius: borderRadius,
            color: (gradient == null) ? bgColor : null,
            boxShadow: boxShadow,
            shape: shape ?? BoxShape.rectangle,
            image: decorationImage,
          ),
      alignment: alignment,
      margin: margin ??
          EdgeInsets.only(
            left: marginLeft,
            right: marginRight,
            top: marginTop,
            bottom: marginBottom,
          ),
      padding: padding ??
          EdgeInsets.only(
            left: paddingLeft,
            right: paddingRight,
            top: paddingTop,
            bottom: paddingBottom,
          ),
      height: height,
      width: width,
      child: child,
    );
  }
}
