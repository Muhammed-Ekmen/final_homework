import 'package:get/get.dart';

extension SizeCtrl on int {
  get w => Get.width / this;
  get h => Get.height / this;
}
