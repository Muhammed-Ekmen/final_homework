part of '../view/launch_view.dart';

class _LaunchMainTemplate extends StatelessWidget {
  const _LaunchMainTemplate({required this.controller});
  final LaunchController controller;

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_schoolName, _usersAndStartField, _teacherName]);
}

extension _SchoolIconAndName on _LaunchMainTemplate {
  get _schoolName => Expanded(
        flex: 15,
        child: "ANKARA\nMEDİPOL ÜNİVERSİTESİ".write(color: Colors.white, size: 24, weight: FontWeight.bold),
      );
}

extension _UserAndStartField on _LaunchMainTemplate {
  get _usersAndStartField => Expanded(flex: 70, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_titleSubtitleField, const Spacer(flex: 5), _startField]));

  get _titleSubtitleField => Expanded(
        flex: 25,
        child: Container(
          width: Get.width,
          height: Get.height,
          alignment: Alignment.centerLeft,
          decoration: _titleSubtitleBoxDecoration,
          child: ListTile(leading: ImageCtrl.medipol.call(type: ImageType.png), title: _title, subtitle: _subtitle),
        ),
      );

  get _titleSubtitleBoxDecoration => BoxDecoration(
        color: IColors.shadowBlack.apply,
        borderRadius: 120.allRadis,
        boxShadow: const [BoxShadow(color: Colors.black54, offset: Offset(1, 1), blurRadius: 10)],
      );

  get _title => "Arpa Hasılı Yetiştirme Programına Hoşgeldiniz".toUpperCase().write(color: Colors.white, size: 20, weight: FontWeight.bold);

  get _subtitle => "Lütfen Menü'den Devam Edin.".write(color: Colors.grey, size: 12, weight: FontWeight.bold);

  get _startField => Expanded(flex: 75, child: Row(children: List.generate(6, _starterBuilder)));

  Widget _starterBuilder(int index) => Expanded(child: index != 5 ? StudentCard(controller: controller, index: index) : _startIconButton);

  get _startIconButton => IconButton(onPressed: controller.startIconOnTap, icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 32));
}

extension _TeacherName on _LaunchMainTemplate {
  get _teacherName => Expanded(
        flex: 10,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: "Ders Sorumlusu: Orhan Gencel".write(color: Colors.grey, size: 12, weight: FontWeight.bold),
        ),
      );
}
