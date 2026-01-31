import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

extension ResponsiveLayoutExtention on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  double wp(double percentage) => width * (percentage / 100);
  double hp(double percentage) => height * (percentage / 100);

  S get loc => S.of(this);
}