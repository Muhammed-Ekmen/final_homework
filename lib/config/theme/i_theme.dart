import 'package:flutter/material.dart';

extension AppTheme on StatelessWidget {
  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Roboto",
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        dividerColor: Colors.transparent,
      );
}
