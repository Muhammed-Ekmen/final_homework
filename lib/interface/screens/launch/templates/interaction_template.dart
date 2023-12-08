part of '../view/launch_view.dart';

class _InteractionTemplate extends StatelessWidget {
  const _InteractionTemplate({required this.controller});
  final LaunchController controller;

  @override
  Widget build(BuildContext context) => Column(children: [_schoolIconName, const Spacer(flex: 1), _questionField, const Spacer(flex: 1), _choicesField]);

  BoxDecoration get _inCommonBoxDecoration => BoxDecoration(borderRadius: 120.allRadis, color: IColors.shadowBlack.apply);
}

extension _SchoolNameIcon on _InteractionTemplate {
  get _schoolIconName => Expanded(
        flex: 15,
        child: Container(
          padding: 100.allPadding,
          decoration: _inCommonBoxDecoration,
          child: Row(children: [_icon, 100.holdW, _schoolName]),
        ),
      );

  get _icon => ImageCtrl.medipol.call(type: ImageType.png, h: 25.w, w: 25.w);

  get _schoolName => "Ankara Medipol\nÜniversitesi".write(color: Colors.white, size: 32, weight: FontWeight.bold);
}

extension _QuestionField on _InteractionTemplate {
  get _questionField => Expanded(
        flex: 15,
        child: Obx(
          () => Container(
            alignment: Alignment.center,
            padding: 100.allPadding,
            decoration: _inCommonBoxDecoration,
            child: controller.choiceIndex.value == 2 ? _arpaInfoListTile : _questionListTile,
          ),
        ),
      );

  get _questionListTile => ListTile(
        leading: Icon(Icons.question_answer, color: Colors.white, size: 50.w),
        title: "Topraksız yetiştirme sistem seçimi yapınız!".write(color: Colors.white, weight: FontWeight.bold, size: 32),
      );

  get _arpaInfoListTile => ListTile(
        leading: Icon(Icons.grass, color: Colors.green, size: 50.w),
        title:
            "Arpa havuzda 24 saat bekliyor, ozon kullanılıyor ve 5000 lux ışığa maruz bırakılıyor. Sıcaklık: 20 derece, Ortam Nem Oranı: 60% Sulama süresi: 60 saniye, Sulama aralığı: 120 dakikaEğim derecesi: 15 derece\nTepsi Karşılaştırması:\nS1 Tepsisi Arpa Miktarı: 1.1 kg\nS6 Tepsisi Arpa Miktarı: 6.6 kg"
                .write(color: Colors.white, weight: FontWeight.bold),
      );
}

extension _ChoiceFiled on _InteractionTemplate {
  get _choicesField => Expanded(flex: 50, child: _gridView);

  get _gridView => GridView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 100),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 10.h),
        itemCount: 4,
        itemBuilder: _gridViewBuilder,
      );

  Widget _gridViewBuilder(BuildContext context, int index) => index != 3 ? _choices(index) : _backButton;

  _choices(int index) => Obx(() => controller.choiceIndex.value == 0
      ? _farmingSystemChoices(index: index)
      : controller.choiceIndex.value == 1
          ? _grainChoice(index: index)
          : _plateSelect(index: index));
}

//Back Button
extension _BackButton on _InteractionTemplate {
  get _backButton => Container(
        width: Get.width,
        height: 40.h,
        alignment: Alignment.center,
        decoration: _inCommonBoxDecoration.copyWith(color: Colors.orange),
        child: _backButtonListTile,
      );

  get _backButtonListTile => ListTile(
        onTap: controller.goBackButtonOnTap,
        title: "Geri Git".write(size: 24, weight: FontWeight.bold),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black, size: 40.w),
      );
}

//Topraksiz yetistirme sistem secimi
extension _FarmingSystemChoices on _InteractionTemplate {
  Container _farmingSystemChoices({required int index}) => Container(
        width: Get.width,
        height: 40.h,
        alignment: Alignment.center,
        decoration: _inCommonBoxDecoration,
        child: ListTile(
          onTap: () => controller.systemSelectionOnTap(index: index),
          leading: Icon(controller.farmingSystemTypesIcons[index], color: Colors.white, size: 40.w),
          title: controller.farmingSystemTypes[index].write(color: Colors.white),
        ),
      );
}

//Tahil Secim Yeri
extension _GrainSelectionChoices on _InteractionTemplate {
  Container _grainChoice({required int index}) => Container(
        width: Get.width,
        height: 40.h,
        alignment: Alignment.center,
        decoration: _inCommonBoxDecoration,
        child: ListTile(
          onTap: () => controller.grainSelectionOnTap(index: index),
          leading: Icon(Icons.grass, color: Colors.green, size: 40.w),
          title: controller.grainSelection[index].write(color: Colors.white),
        ),
      );
}

//Tepsi Secimi
extension _PlateSelect on _InteractionTemplate {
  Container _plateSelect({required int index}) => Container(
        width: Get.width,
        height: 40.h,
        alignment: Alignment.center,
        decoration: _inCommonBoxDecoration,
        child: index == 2
            ? _productTree
            : ListTile(
                onTap: () => controller.plateSelectOnTap(index: index),
                leading: Icon(Icons.palette, color: Colors.white, size: 40.w),
                title: "Tepsi $index".write(color: Colors.white, weight: FontWeight.bold),
              ),
      );

  get _productTree => Container(
        width: Get.width,
        alignment: Alignment.center,
        decoration: _inCommonBoxDecoration.copyWith(color: Colors.orange),
        child: ListTile(
          onTap: controller.productTreeOnTap,
          title: "Ürün Ağacı".write(size: 24, weight: FontWeight.bold),
          leading: Icon(Icons.connect_without_contact, size: 40.w, color: Colors.black),
        ),
      );
}
