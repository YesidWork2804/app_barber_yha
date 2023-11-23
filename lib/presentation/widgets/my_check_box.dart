import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app/providers_app.dart';

class MyChechBox extends StatelessWidget {
  const MyChechBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<ProvidersApp>(context);
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Checkbox(
        activeColor: AppTheme.colorButton,
        checkColor: themeProvider.theme.primaryColor,
        value: appProvider.checkBoxCheked,
        onChanged: (bool? value) {
          appProvider.toggleVisibilityCheckBox();
        });
  }
}
