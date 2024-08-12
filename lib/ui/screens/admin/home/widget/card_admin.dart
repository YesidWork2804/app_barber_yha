import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme/app_theme_provider.dart';

class CardAdmin extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final String image;
  final GestureTapCallback onTap;

  const CardAdmin({
    super.key,
    this.width = 50,
    this.height = 50,
    this.image = 'logo_barberos.png',
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: themeProvider.theme.cardColor,
          borderRadius: BorderRadius.circular(10.0), // radio de borde
        ),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/admin/$image',
              width: 99,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: themeProvider.theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
