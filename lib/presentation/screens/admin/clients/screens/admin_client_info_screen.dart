import '../../../../providers/providers.dart';
import '../../../../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/button_icon_text_widget.dart';

class AdminClientInfo extends StatelessWidget {
  final String nombre;
  final String telefono;
  final String foto;

  const AdminClientInfo({
    super.key,
    required this.nombre,
    required this.telefono,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const ButtonTopNavigatorWidget(
              buttonUser: false,
            ),
            Text('Cliente', style: themeProvider.theme.textTheme.titleLarge),
            const SizedBox(
              height: 20,
            ),
            Image.asset(foto),
            const SizedBox(height: 20),
            Text(nombre,
                style: themeProvider.theme.textTheme.displayLarge
                    ?.copyWith(fontSize: 30)),
            const SizedBox(height: 20),
            Text(telefono, style: themeProvider.theme.textTheme.bodyLarge),
            const SizedBox(height: 20),
            // ContainerEstadoWidget(estado: estado, cantidadTurno: cantidadTurno),
            const SizedBox(height: 220),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonIconTextWidget(
                  iconData: Icons.phone,
                  text: 'Llamar',
                  fuction: () {},
                ),
                ButtonIconTextWidget(
                  iconData: Icons.delete,
                  text: 'Eliminar',
                  fuction: () {},
                ),
                ButtonIconTextWidget(
                  iconData: Icons.edit,
                  text: 'Editar',
                  fuction: () {},
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
