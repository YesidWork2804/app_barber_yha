import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/theme/theme.dart';
import '../../../../providers/providers.dart';

class ContainerInfoSalesScreen extends StatelessWidget {
  final String text;
  final IconData icon;
  const ContainerInfoSalesScreen(
      {super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Container(
      width: 340,
      height: 120,
      decoration: BoxDecoration(
        color: themeProvider.theme.cardColor, // Color de fondo del container
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
        border: Border.all(
            color: themeProvider.theme.cardColor,
            width: 2), // Borde de color negro y grosor 2
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70,
            color: AppTheme.secondaryColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(text,
              style: themeProvider.theme.textTheme.bodyLarge
                  ?.copyWith(fontSize: 30))
        ],
      ),
    );
  }
}
