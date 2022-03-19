import 'package:expense_manager/app.dart';
import 'package:expense_manager/providers/creditcard_provider.dart';
import 'package:expense_manager/providers/theme_provider.dart';
import 'package:expense_manager/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(themeMode: AppTheme.currentThemeMode),
        ),
        ChangeNotifierProvider(
          create: (_) => CreditCardProvider(),
        )
      ],
      child: const App(),
    );
  }
}
