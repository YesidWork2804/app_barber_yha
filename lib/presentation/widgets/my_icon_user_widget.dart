import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class MyIconUserWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback fuction;

  const MyIconUserWidget({Key? key, required this.icon, required this.fuction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        color: AppTheme.colorButton,
        icon: Icon(
          icon,
          size: 40,
        ));
  }
}
