import 'package:final_homework/core/controller/color_ctrl.dart';
import 'package:final_homework/core/controller/image_ctrl.dart';
import 'package:final_homework/core/controller/size_ctrl.dart';
import 'package:final_homework/core/controller/text_ctrl.dart';
import 'package:final_homework/interface/screens/launch/controller/launch_controller.dart';
import 'package:final_homework/interface/widgets/cards/student_card.dart';
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
  get _body => Stack(alignment: Alignment.center, children: [_backgroundImage, _imageShadow, _launchTemplate]);

  get _backgroundImage => ImageCtrl.farm.call(h: Get.height, w: Get.width);

  get _imageShadow => Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black12, Colors.black26, Colors.black38, Colors.black45, Colors.black54, Colors.black87],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );

  get _launchTemplate => const _LaunchMainTemplate();
}
