import 'package:final_homework/core/controller/image_ctrl.dart';
import 'package:final_homework/core/controller/size_ctrl.dart';
import 'package:final_homework/core/controller/text_ctrl.dart';
import 'package:final_homework/interface/screens/launch/view_model/launch_view_model.dart';
import 'package:final_homework/source/models/grain_model.dart';
import 'package:final_homework/source/service/service_grain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchController extends LaunchViewModel {
  @override
  void onInit() async {
    await initData();
    await readGrains();
    super.onInit();
  }

  @override
  startIconOnTap() {
    templateIndex.value = 1;
    templateIndex.refresh();
  }

  @override
  goBackButtonOnTap() {
    Get.back();
    templateIndex.value = 0;
    choiceIndex.value = 0;
    templateIndex.refresh();
  }

  @override
  systemSelectionOnTap({required int index}) {
    if (index == 2) {
      choiceIndex.value = 1;
    } else {
      Get.snackbar("Malesef Bu Sistem Şu An Geçerli Değil", "Lütfen Farklı Bir Seçenek Seçiniz", backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  @override
  grainSelectionOnTap({required int index}) {
    if (index == 2) {
      choiceIndex.value = 2;
    } else {
      Get.snackbar("Malesef Bu Sistem Şu An Geçerli Değil", "Lütfen Farklı Bir Seçenek Seçiniz", backgroundColor: Colors.black, colorText: Colors.white);
    }
  }

  @override
  plateSelectOnTap({required int index}) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.black,
        title: "Sonuc".write(color: Colors.white, weight: FontWeight.bold, size: 36),
        content: _infoContent,
      ),
    );
  }

  get _infoContent => SizedBox(
        width: 3.w,
        height: 3.w,
        child: Column(children: [Expanded(flex: 7, child: _infoText), const Spacer(flex: 1), Expanded(flex: 1, child: _backButton)]),
      );

  get _infoText =>
      " Araştırma sonuçlarına göre farklı tohum miktarları uygulamalarında en yüksek yeşil yem tohum oranı ham protein kazancı, kök uzunluğu , P,Zn, ve Na değerleri ile en düşük kuru madde kayıpları S1 uygulamasından elde edilmiştir. En yüksek  yeşil yem verimi, bitki boyu,ADL,metabolik enerji,K,Fe ve Mn değerleri ise S6 uygulamalarından elde edilmiştir.Yüksek yeşil yem tohum oranı ve ham protein kazancı ile düşük kuru madde kayıplarına sahip hidroponik  yeşil arpa yemi üretimi için S1 tohum miktarı uygulamaları tavsiye edilebilir niteliktedir "
          .write(
        color: Colors.white,
        weight: FontWeight.bold,
      );

  get _backButton => Container(
        width: 2.w,
        height: 100.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.orange),
        child: _backButtonListTile,
      );

  get _backButtonListTile => ListTile(
        onTap: goBackButtonOnTap,
        title: "Geri Git".write(size: 24, weight: FontWeight.bold),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black, size: 40.w),
      );

  @override
  Future<void> initData() async {
    int id = await ServiceGrain.addGrain();
    debugPrint("ID $id");
  }

  @override
  Future<List<GrainModel>> readGrains() async {
    grains.value = await ServiceGrain.readGrains();
    for (var value in grains) {
      debugPrint("heat ${value.heat}");
    }
    return grains;
  }

  @override
  productTreeOnTap() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.black,
        title: "Ürün Ağacı".write(color: Colors.white, weight: FontWeight.bold, size: 36),
        content: _productTreeContent,
      ),
    );
  }

  get _productTreeContent => SizedBox(
        width: 3.w,
        height: 3.w,
        child: Column(children: [Expanded(flex: 7, child: _imageField), const Spacer(flex: 1), Expanded(flex: 1, child: _backButton)]),
      );

  get _imageField => Row(children: [_imageOne, const Spacer(flex: 1), _imageTwo]);

  get _imageOne => Expanded(flex: 20, child: ImageCtrl.productOne.call(type: ImageType.png));

  get _imageTwo => Expanded(flex: 20, child: ImageCtrl.productTwo.call(type: ImageType.png));
}
