import 'package:epi_seguranca/util/constants/string.constants.dart';
import 'package:epi_seguranca/util/theme/theme.dart';
import 'package:epi_seguranca/view/home.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ApplicationConstants.appName,
      theme: defaultTheme,
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
