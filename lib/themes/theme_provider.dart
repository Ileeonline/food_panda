import 'package:flutter/material.dart';
import 'package:food_panda/themes/dark_mode.dart';
import 'package:food_panda/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themedata => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (themedata == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
