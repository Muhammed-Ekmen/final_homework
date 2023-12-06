import 'package:final_homework/interface/screens/launch/view/launch_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum RouteCtrl { launch }

extension RouteCtrlExt on RouteCtrl {
  String get path => this == RouteCtrl.launch ? "/" : "/$name";

  Future<dynamic>? go({dynamic arg}) => Get.offNamed(path, arguments: arg);

  StatelessWidget get view {
    switch (this) {
      case RouteCtrl.launch:
        return LaunchView();
      default:
        return LaunchView();
    }
  }
}
