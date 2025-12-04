import 'package:flutter/material.dart';


const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];
class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  }):assert(selectedColor >= 0, 'Color must be between 0 and ${colorList.length - 1}'),
    assert(selectedColor < colorList.length, 'Color must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ),
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor]
  );


  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode
  );

}