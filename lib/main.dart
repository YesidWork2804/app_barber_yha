import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Importaciones Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'presentation/providers/app/providers_app.dart';
import 'presentation/providers/theme/app_theme_provider.dart';
import 'presentation/screens/login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
