import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';

class ButtonThemeAppWidget extends StatelessWidget {
  const ButtonThemeAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return IconButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        icon: Icon(
          themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: AppTheme.colorButton,
          size: 40,
        ));
  }
}
