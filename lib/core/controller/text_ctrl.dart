import 'package:flutter/material.dart';

extension StringExt on String {
  write({double? size, Color? color, FontWeight? weight, TextAlign? textAlign}) => Text(
        this,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight),
        textAlign: textAlign,
      );
}
