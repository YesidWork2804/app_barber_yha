import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme/app_theme_provider.dart';

class TitleIconWidget extends StatelessWidget {
  const TitleIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Image.asset(
      'assets/img/titulo.png',
      height: 220,
      color: themeProvider.theme.primaryColor,
    );
  }
}
