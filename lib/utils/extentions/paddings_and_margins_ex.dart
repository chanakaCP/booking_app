import 'package:flutter/material.dart';

extension PaddingAndMargins on num {
  EdgeInsets get top => EdgeInsets.only(top: toDouble());
  EdgeInsets get bottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsets get left => EdgeInsets.only(top: toDouble());
  EdgeInsets get right => EdgeInsets.only(right: toDouble());

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets hv(doubel, double) =>
      EdgeInsets.symmetric(horizontal: toDouble(), vertical: toDouble());

  EdgeInsets get all => EdgeInsets.all(toDouble());
}
