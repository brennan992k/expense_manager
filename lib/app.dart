import 'package:expense_manager/providers/creditcard_provider.dart';
import 'package:expense_manager/providers/theme_provider.dart';
import 'package:expense_manager/route.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    context.read<CreditCardProvider>().sync();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeProvider>().updateTheme(AppTheme.currentThemeMode);
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context.select<ThemeProvider, ThemeMode>(
          (ThemeProvider provider) => provider.themeMode),
      initialRoute: AppRoute.initialRoute,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
