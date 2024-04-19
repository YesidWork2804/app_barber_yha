import 'package:app_barber_yha/app/router/routes_app.dart';
import 'package:app_barber_yha/presentation/screens/admin/home/widget/card_admin.dart';
import 'package:app_barber_yha/presentation/screens/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';
import '../admin_barber/admin_barber.dart';
import '../clients/admin_clients_home.dart';
import '../inventory/screens/inventory_home_screen.dart';
import '../sales/screens/sales_home_screen.dart';

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
                  right: 20,
                  child: MyIconAppWidget(
                    fuction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
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
                        image: 'personal.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminBarbersScreen()));
                        },
                      ),
                      CardAdmin(
                        text: 'Inventario',
                        image: 'logo_inventario.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const InventoryHomeScreen()));
                        },
                      ),
                      CardAdmin(
                        text: 'Clientes',
                        image: 'logo_clientes.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminClientsHomeScreen()));
                        },
                      ),
                      CardAdmin(
                        text: 'Agendar Turno',
                        image: 'agendar_2.png',
                        onTap: () {},
                      ),
                      CardAdmin(
                        text: 'Ventas',
                        image: 'logo_ventas.png',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SalesHomeScreen()));
                        },
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
