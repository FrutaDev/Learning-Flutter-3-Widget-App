import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    required this.selectedColor
  }) : assert (selectedColor >= 0 && selectedColor < colorList.length, "Invalid color index");

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
        appBarTheme: AppBarTheme(
          centerTitle: false,
  )
  );

}
