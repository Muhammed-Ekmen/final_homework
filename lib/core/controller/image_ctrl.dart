import 'package:flutter/material.dart';

enum ImageCtrl { farm, medipol }

enum ImageType { jpg, png }

extension ImageCtrlExt on ImageCtrl {
  call({double? w, double? h, ImageType type = ImageType.jpg}) => SizedBox(
        width: w,
        height: h,
        child: Image.asset("assets/image/$name.${type.name}", fit: BoxFit.cover),
      );
}
