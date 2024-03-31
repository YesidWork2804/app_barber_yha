import 'package:app_barber_yha/app/router/routes_app.dart';
import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/screens/admin/home/widget/card_admin.dart';
import 'package:app_barber_yha/presentation/widgets/title_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme/app_theme_provider.dart';
import '../../../widgets/widgets.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdminScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<HomeAdminScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calcula el número de elementos en una fila basado en el ancho de la pantalla
    int crossAxisCount = (screenWidth / 150).floor();

    return Scaffold(
      bottomNavigationBar: IconButton(
          onPressed: () {
            goRouter.go('/login');
          },
          icon: const Icon(Icons.ac_unit_sharp)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 20,
                  child: MyIconUserWidget(
                    fuction: () {},
                    icon: Icons.account_circle_rounded,
                  )),
              Column(children: [
                const TitleIconWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 23,
                    mainAxisSpacing: 24,
                    children: [
                      CardAdmin(
                        text: 'Personal',
                        image: 'logo_barberos.png',
                        onTap: () {},
                      ),
                      CardAdmin(
                        text: 'Inventario',
                        image: 'logo_inventario.png',
                        onTap: () {},
                      ),
                      CardAdmin(
                        text: 'Clientes',
                        image: 'logo_clientes.png',
                        onTap: () {},
                      ),
                      CardAdmin(
                        text: 'Agendar Turno',
                        image: 'logo_agendarTurno.png',
                        onTap: () {},
                      ),
                      CardAdmin(
                        text: 'Ventas',
                        image: 'logo_ventas.png',
                        onTap: () {},
                      ),
                      CardAdmin(
                        text: 'Reportes',
                        image: 'logo_reportes.png',
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
