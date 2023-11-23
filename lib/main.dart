import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/app/providers_app.dart';
import 'presentation/providers/theme/app_theme_provider.dart';
import 'presentation/screens/login/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvidersApp(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.theme,
        home: const LoginScreen());
  }
}
