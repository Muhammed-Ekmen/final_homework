import 'package:flutter/material.dart';

enum ImageCtrl { farm }

extension ImageCtrlExt on ImageCtrl {
  call({double? w, double? h, Color? color}) => SizedBox(
        width: w,
        height: h,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(color ?? Colors.black54, BlendMode.srcATop),
          child: Image.asset("assets/image/$name.jpg", fit: BoxFit.cover),
        ),
      );
}
