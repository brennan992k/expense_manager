import 'package:expense_manager/models/creditcard_model.dart';
import 'package:expense_manager/screens/add.dart';
import 'package:expense_manager/screens/detail.dart';
import 'package:expense_manager/screens/home.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String homeRoute = '/';
  static const String addRoute = '/add';
  static const String detailRoute = '/detail';

  static String get initialRoute => homeRoute;

  static Route onGenerateRoute(RouteSettings settings) {
    late final Widget screen;
    switch (settings.name) {
      case homeRoute:
        screen = const HomeScreen();
        break;
      case addRoute:
        screen = AddScreen();
        break;
      case detailRoute:
        CreditCardModel info = settings.arguments as CreditCardModel;
        screen = DetailScreen(info: info);
        break;
      default:
        screen = const HomeScreen();
        break;
    }
    return _buildRoute(settings, screen: screen);
  }

  static Route _buildRoute(RouteSettings settings, {required Widget screen}) {
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  }
}
