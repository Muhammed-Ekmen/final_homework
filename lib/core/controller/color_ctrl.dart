import 'package:flutter/material.dart';

enum IColors { shadowBlack }

extension IColorsExt on IColors {
  Color get apply {
    switch (this) {
      case IColors.shadowBlack:
        return const Color(0xFF161616);
      default:
        return const Color(0xFF2B2C31);
    }
  }
}
