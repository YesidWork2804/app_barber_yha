import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme/app_theme_provider.dart';

class ContainerEstadoWidget extends StatelessWidget {
  final bool estado;
  final int cantidadTurno;

  const ContainerEstadoWidget(
      {super.key, required this.estado, required this.cantidadTurno});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Container(
        decoration: BoxDecoration(
            color: () {
              if (estado) {
                return AppTheme.colorButton;
              } else {
                return AppTheme.secondaryColor;
              }
            }(),
            borderRadius: BorderRadius.circular(10)),
        width: 90,
        height: 20,
        child: Center(child: () {
          if (cantidadTurno == 1 && estado) {
            return Text(
              '$cantidadTurno Turno',
              style: themeProvider.theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            );
          } else if (!estado) {
            return Text(
              'Inactivo',
              style: themeProvider.theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            );
          } else {
            return Text(
              '$cantidadTurno Turnos',
              style: themeProvider.theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            );
          }
        }()));
  }
}
