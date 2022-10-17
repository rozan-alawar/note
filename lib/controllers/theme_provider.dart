import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  Color? color;
  int? selectedIndex;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  toogleTheme(bool lightOrDark) {
    themeMode = lightOrDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  cardColor(Color? color) {
    this.color = color;
    notifyListeners();
  }

  selectedColor(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}
