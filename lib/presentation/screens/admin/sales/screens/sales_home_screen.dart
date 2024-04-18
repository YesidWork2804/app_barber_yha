import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../infrasctructure/repositories/barbers/barber_repository.dart';
import '../../home/home_admin_screen.dart';
import '../../inventory/widgets/inventory_widgets.dart';
import 'info_sales_screen.dart';

class SalesHomeScreen extends StatefulWidget {
  const SalesHomeScreen({super.key});

  @override
  State<SalesHomeScreen> createState() => _SalesHomeScreenState();
}

final BarberRepository repository = BarberRepository();

class _SalesHomeScreenState extends State<SalesHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 150).floor();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconAdminWidget(
                  iconData: Icons.arrow_back_ios,
                  fuction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeAdminScreen()));
                  },
                  text: ''),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Ventas',
                        style: themeProvider.theme.textTheme.titleLarge),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        crossAxisSpacing: 23,
                        mainAxisSpacing: 24,
                        children: <Widget>[
                          ContainersHomeWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InfoSalesScreen()));
                            },
                            photo: 'assets/img/sales/ventas_logo.png',
                            text: 'Vender Productos',
                          ),
                          ContainersHomeWidget(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const ProductsScreen()));
                            },
                            photo: 'assets/img/barber-pole.png',
                            text: 'Historial de ventas',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
