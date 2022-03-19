import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static double spacing1 = 20;
  static double spacing2 = 10;
  static double borderRadius1 = 20;
  static double borderRadius2 = 10;

  static TextStyle textStyle = const TextStyle(
      color: Color.fromARGB(255, 40, 40, 40), wordSpacing: 1, height: 1);

  static ThemeData light = ThemeData(
      backgroundColor: const Color.fromARGB(255, 232, 228, 228),
      scaffoldBackgroundColor: const Color.fromARGB(255, 232, 228, 228),
      textTheme: TextTheme(
        bodyLarge: textStyle.copyWith(fontSize: 18),
        bodyMedium: textStyle.copyWith(fontSize: 14),
        bodySmall: textStyle.copyWith(fontSize: 12),
      ),
      iconTheme: const IconThemeData(
        color: Colors.grey,
        size: 25,
        opacity: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(spacing2),
        ),
        hintStyle: textStyle.copyWith(color: Colors.grey, fontSize: 14),
        errorStyle: textStyle.copyWith(
            color: const Color.fromARGB(255, 142, 45, 39), fontSize: 12),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ));

  static ThemeData dark = ThemeData(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
      textTheme: TextTheme(
        bodyLarge: textStyle.copyWith(fontSize: 18, color: Colors.white),
        bodyMedium: textStyle.copyWith(fontSize: 14, color: Colors.white),
        bodySmall: textStyle.copyWith(fontSize: 12, color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 25,
        opacity: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color.fromARGB(255, 46, 45, 45),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(spacing2),
        ),
        hintStyle: textStyle.copyWith(color: Colors.grey, fontSize: 14),
        errorStyle: textStyle.copyWith(
            color: const Color.fromARGB(255, 142, 45, 39), fontSize: 12),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ));

  static Brightness get currentBrightness =>
      WidgetsBinding.instance!.window.platformBrightness;

  static ThemeMode get currentThemeMode =>
      currentBrightness == Brightness.light ? ThemeMode.dark : ThemeMode.light;

  static setAppBarStatus(ThemeMode themeMode) {
    print(themeMode);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppTheme.light.backgroundColor
          : AppTheme.dark.backgroundColor,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
    ));
  }
}
