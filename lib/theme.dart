import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
    notifyListeners();
  }
}

final lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  brightness: Brightness.dark,
);
