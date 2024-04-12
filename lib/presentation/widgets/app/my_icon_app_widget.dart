import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyIconAppWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback fuction;
  final double size;

  const MyIconAppWidget(
      {Key? key, required this.icon, required this.fuction, this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: fuction,
        color: AppTheme.colorButton,
        icon: Icon(
          icon,
          size: size,
        ));
  }
}
