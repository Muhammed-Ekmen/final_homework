import 'package:final_homework/core/controller/route_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension AppRoute on StatelessWidget {
  List<GetPage<dynamic>>? get pages => RouteCtrl.values.map((RouteCtrl route) => GetPage(name: route.path, page: () => route.view)).toList();
}
