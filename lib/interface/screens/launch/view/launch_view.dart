import 'package:final_homework/core/controller/image_ctrl.dart';
import 'package:final_homework/core/controller/size_ctrl.dart';
import 'package:final_homework/interface/screens/launch/controller/launch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
part '../templates/launch_main_template.dart';

class LaunchView extends StatelessWidget {
  LaunchView({super.key});
  final LaunchController controller = Get.put(LaunchController());

  @override
  Widget build(BuildContext context) => Scaffold(body: _body);
}

extension LaunchViewBody on LaunchView {
  get _body => Stack(alignment: Alignment.center, children: [_backgroundImage, _launchTemplate]);

  get _backgroundImage => ImageCtrl.farm.call(h: Get.height);

  get _launchTemplate => const _LaunchMainTemplate();
}
