import 'package:final_homework/config/route/i_routes.dart';
import 'package:final_homework/config/theme/i_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: pages,
        theme: theme,
      );
}
