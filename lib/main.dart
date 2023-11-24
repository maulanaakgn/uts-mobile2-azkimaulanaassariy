import 'package:flutter/material.dart';
import 'package:uts_azkimaulanaassariy_flutter_sem5/menu/main_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}