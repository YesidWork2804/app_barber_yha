import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';

class ButtonIconTextWidget extends StatelessWidget {
  final String text;
  final Function()? fuction;
  final IconData iconData;

  const ButtonIconTextWidget(
      {super.key, required this.text, this.fuction, required this.iconData});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: fuction,
              icon: Icon(
                color: AppTheme.colorButton,
                iconData,
                size: 40,
              )),
          Text(
            text,
            style: themeProvider.theme.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
