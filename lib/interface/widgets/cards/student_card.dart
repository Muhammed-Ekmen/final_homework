import 'package:final_homework/core/controller/color_ctrl.dart';
import 'package:final_homework/core/controller/size_ctrl.dart';
import 'package:final_homework/core/controller/text_ctrl.dart';
import 'package:final_homework/interface/screens/launch/controller/launch_controller.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.controller, required this.index});
  final LaunchController controller;
  final int index;

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: Get.width / 500),
        height: Get.height,
        decoration: _boxDecoration,
        child: _content,
      );

  get _boxDecoration => BoxDecoration(
        color: IColors.shadowBlack.apply,
        borderRadius: 80.allRadis,
        boxShadow: const [BoxShadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 10, inset: true)],
      );
}

extension StudentCardContent on StudentCard {
  get _content => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_studentImage, _studentName],
      );

  get _studentImage => Expanded(
        flex: 6,
        child: Container(
          width: 20.w,
          height: 20.h,
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
      );

  get _studentName => Expanded(
        flex: 4,
        child: controller.studentNames[index].write(color: Colors.white, textAlign: TextAlign.center, weight: FontWeight.bold),
      );
}
