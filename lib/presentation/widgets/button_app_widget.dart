import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonAppWidget extends StatelessWidget {
  final String labelButton;
  final double? width;
  final Function()? fuction;
  const ButtonAppWidget(
      {Key? key, required this.labelButton, this.width, this.fuction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return ElevatedButton(
        onPressed: fuction,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(179, 58),
          backgroundColor: AppTheme.colorButton, // Color de fondo del botón
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Borde redondeado
          ),
        ),
        child: Text(
          labelButton,
          style: themeProvider.theme.textTheme.displayLarge
              ?.copyWith(color: AppTheme.colorPrimaryDarkTheme),
        ));
  }
}
