import 'package:flutter/material.dart';
import 'package:expense_manager/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode;

  ThemeProvider({this.themeMode = ThemeMode.light});
  
  updateTheme(ThemeMode mode) {
    if (mode != themeMode) {
      themeMode = mode;
      AppTheme.setAppBarStatus(mode);
      notifyListeners();
    }
  }
}
