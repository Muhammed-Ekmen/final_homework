part of '../view/launch_view.dart';

class _LaunchMainTemplate extends StatelessWidget {
  const _LaunchMainTemplate();

  @override
  Widget build(BuildContext context) => Container(width: 2.w, height: 2.h, padding: 50.allPadding, decoration: _boxDecoration, child: _content);

  get _boxDecoration => BoxDecoration(
        color: Colors.black.withOpacity(0.85),
        borderRadius: 43.allRadis,
        boxShadow: [BoxShadow(color: IColors.shadowBlack.apply, offset: const Offset(5, 5), blurRadius: 12)],
      );
}

extension _ContentField on _LaunchMainTemplate {
  get _content => Column(children: [_schoolIconAndName, _usersAndStartField, _teacherName]);
}

extension _SchoolIconAndName on _LaunchMainTemplate {
  get _schoolIconAndName => Expanded(flex: 25, child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [_icon, 100.holdW, _name]));

  get _icon => ImageCtrl.medipol.call(type: ImageType.png, h: 25.w, w: 25.w);

  get _name => "ANKARA\nMEDİPOL ÜNİVERSİTESİ".write(color: Colors.white, size: 24, weight: FontWeight.bold);
}

extension _UserAndStartField on _LaunchMainTemplate {
  get _usersAndStartField => Expanded(flex: 70, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_titleSubtitleField, _startField]));

  get _titleSubtitleField => Expanded(flex: 25, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_title, _subtitle]));

  get _title => "Arpa Yetiştirme Programına Hoşgeldiniz".write(color: Colors.white, size: 20);

  get _subtitle => "Lütfen Menü'den Devam Edin.".write(color: Colors.grey, size: 12);

  get _startField => Expanded(flex: 75, child: Row(children: List.generate(6, _starterBuilder)));

  Widget _starterBuilder(int index) => Expanded(child: index != 5 ? const StudentCard() : _startIconButton);

  get _startIconButton => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 32),
      );
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
