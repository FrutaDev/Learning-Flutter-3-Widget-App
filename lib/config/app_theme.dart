import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
  Colors.amber,
  Colors.orange,
  Colors.red,
];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
  }) : assert (selectedColor >= 0 && selectedColor < colorList.length, "Invalid color index");

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
        appBarTheme: AppBarTheme(
          centerTitle: false,
  )
  );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode
  }) =>
      AppTheme(
          selectedColor: selectedColor ?? this.selectedColor,
          isDarkMode: isDarkMode ?? this.isDarkMode
      );

}
