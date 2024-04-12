import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownButtonWidget extends StatelessWidget {
  const DropDownButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    String selectedItem = 'Categorias';
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: DropdownButtonFormField<String>(
          iconSize: 40,
          iconEnabledColor: AppTheme.colorButton,
          value: selectedItem,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.abc),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 12.0,
            ),
            filled: true,
            fillColor: themeProvider.theme.cardColor,
            border: InputBorder.none,
          ),
          items: <String>[
            'Categorias',
            'Refrescos y Agua',
            'Cefe y Te',
            'Cervezas',
            'Zumos y Batidos',
            'Snacks',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              onTap: () {},
              value: value,
              child:
                  Text(value, style: themeProvider.theme.textTheme.bodyMedium),
            );
          }).toList(),
          onChanged: (value) => {}),
    );
  }
}
