import 'package:dggroup_test/utils/styles/app_style.dart';
import 'package:dggroup_test/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: AppTheme.light, home: HomePage());
  }
}
