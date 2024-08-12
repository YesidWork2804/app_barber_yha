import 'package:app_barber_yha/ui/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../infrasctructure/barbers/barber_repository.dart';
import '../../home/home_admin_screen.dart';
import '../../widgets/containers_home_widget.dart';
import '../../widgets/icon_inventory_widget.dart';
import 'food_drink/food_drink_screen.dart';
import 'products/products_screen.dart';

class InventoryHomeScreen extends StatefulWidget {
  const InventoryHomeScreen({super.key});

  @override
  State<InventoryHomeScreen> createState() => _InventoryHomeScreenState();
}

final BarberRepository repository = BarberRepository();

class _InventoryHomeScreenState extends State<InventoryHomeScreen> {
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
            // const ButtonTopNavigatorWidget(
            //   buttonUser: false,
            // ),
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
                    Text('Inventario',
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
                                      builder: (context) => FoodDrinkScreen(
                                            context: context,
                                          )));
                            },
                            photo: 'assets/img/comidasybebidas.png',
                            text: 'Comidas y Bebidas',
                          ),
                          ContainersHomeWidget(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductsScreen()));
                            },
                            photo: 'assets/img/productos_3.png',
                            text: 'Productos',
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
