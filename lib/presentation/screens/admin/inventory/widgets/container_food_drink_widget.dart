import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme/app_theme_provider.dart';
import 'inventory_widgets.dart';

class ContainerFoodDrinkWidget extends StatelessWidget {
  final String foto;
  final String nombre;
  final String descripcion;

  // final VoidCallback onTap;
  final double height;
  final int precio;
  final int unidades;

  const ContainerFoodDrinkWidget(
      {super.key,
      // required this.onTap,
      this.height = 80,
      required this.foto,
      required this.nombre,
      required this.precio,
      required this.unidades,
      required this.descripcion});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoFoodDrinkWidget(
                      foto: foto,
                      nombre: nombre,
                      precio: precio,
                      unidades: unidades,
                      descripcion: descripcion,
                    )));
      },
      child: Container(
        width: 320,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeProvider.theme.cardColor),
        child: Row(
          children: [
            Image.asset(
              foto,
              width: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: themeProvider.theme.textTheme.bodyMedium,
                ),
                Text(
                  '$unidades Unidades',
                  style: themeProvider.theme.textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170, top: 30),
                  child: Text(
                    '\$$precio',
                    style: themeProvider.theme.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
