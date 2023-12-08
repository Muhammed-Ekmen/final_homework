import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizeCtrl on int {
  get w => Get.width / this;
  get h => Get.height / this;
  get holdH => SizedBox(height: Get.height / this);
  get holdW => SizedBox(width: Get.width / this);
  get allPadding => EdgeInsets.all(Get.width / this);
  get allRadis => BorderRadius.circular(Get.width / this);
}

extension SizeCtrlDouble on double {
  double get h => Get.height / this;
  double get w => Get.width / this;
}
