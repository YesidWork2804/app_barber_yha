import 'package:flutter/material.dart';
import '../screens/set_up_account_screen.dart';
import '../screens/set_up_password_screen.dart';
import 'container_button_widget.dart';
import 'container_check_box_widget.dart';

class ContainerProfileWidget extends StatelessWidget {
  const ContainerProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContainerButtonWidget(
            fuction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetUpAccountScreen()));
            },
            iconDataLeft: Icons.account_circle,
            textTitle: 'Configurar Cuenta',
          ),
          const SizedBox(height: 20),
          const ContainerCheckBoxWidget(
              iconDataLeft: Icons.location_on_outlined,
              textTitle: 'Localizacion',
              textInfo: 'Mejorara las funcionalidades de la aplicacion'),
          const SizedBox(height: 20),
          const ContainerCheckBoxWidget(
              iconDataLeft: Icons.notifications,
              textTitle: 'Notificaciones',
              textInfo: 'Solicitudes, Cambios y Actividades'),
          const SizedBox(height: 20),
          ContainerButtonWidget(
            fuction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetUpPasswordScreen()));
            },
            iconDataLeft: Icons.account_circle,
            textTitle: 'Cambiar Contraseña',
          ),
          ContainerButtonWidget(
            fuction: () {},
            iconDataLeft: Icons.exit_to_app_sharp,
            textTitle: 'Cerrar Sesion',
          ),
        ],
      ),
    );
  }
}
