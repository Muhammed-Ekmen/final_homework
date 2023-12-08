import 'package:final_homework/source/models/grain_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LaunchViewModel extends GetxController {
  RxInt templateIndex = RxInt(0);
  RxInt choiceIndex = RxInt(0);
  RxList<GrainModel> grains = <GrainModel>[].obs;

  List<String> farmingSystemTypes = ["Aquaponik sistem", "Aeroponik sistem", "Hidroponik sistem"];

  List<IconData> farmingSystemTypesIcons = [Icons.water, Icons.wind_power, Icons.grass];

  List<String> grainSelection = ["Buğday", "Mısır", "Arpa"];

  List<String> studentNames = ["Muhammed Semih\nEkmen", "Eyüp Furkan\nSezer", "Gizem Sayın", "Kübra Ay\nÇavuşoğlu", "Zübeyde Yavuz"];

  startIconOnTap();
  goBackButtonOnTap();
  systemSelectionOnTap({required int index});
  grainSelectionOnTap({required int index});
  plateSelectOnTap({required int index});
  Future<void> initData();
  Future<List<GrainModel>> readGrains();
  productTreeOnTap();
}
