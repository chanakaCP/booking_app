import 'package:flutter/material.dart';

extension ContainerBorderRadius on num {
  BorderRadius get topLeftRadius =>
      BorderRadius.only(topLeft: Radius.circular(toDouble()));
  BorderRadius get topRightRadius =>
      BorderRadius.only(topRight: Radius.circular(toDouble()));
  BorderRadius get bottomLeftRadius =>
      BorderRadius.only(bottomLeft: Radius.circular(toDouble()));
  BorderRadius get bottomRightRadius =>
      BorderRadius.only(bottomRight: Radius.circular(toDouble()));

  BorderRadius get rightRadius => BorderRadius.only(
        bottomRight: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get leftRadius => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        topLeft: Radius.circular(toDouble()),
      );

  BorderRadius get topRadius => BorderRadius.only(
        topLeft: Radius.circular(toDouble()),
        topRight: Radius.circular(toDouble()),
      );
  BorderRadius get bottomRadius => BorderRadius.only(
        bottomLeft: Radius.circular(toDouble()),
        bottomRight: Radius.circular(toDouble()),
      );

  BorderRadius get fullRadius => BorderRadius.all(Radius.circular(toDouble()));
}
