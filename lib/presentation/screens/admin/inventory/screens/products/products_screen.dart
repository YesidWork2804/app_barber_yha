import 'package:app_barber_yha/presentation/providers/theme/app_theme_provider.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/screens/products/providers/providers_products.dart';
// import 'package:app_barber_yha/presentation/screens/admin/inventory/widgets/container_filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../infrasctructure/repositories/inventario/products/product_repositorie.dart';
import '../../widgets/inventory_widgets.dart';
import '../inventory_home_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductRepository repository = ProductRepository();
    final providersProduct = Provider.of<ProvidersProducts>(
      context,
    ); // Obtén el modelo de búsqueda desde el proveedor

    final themeProvider = Provider.of<AppThemeProvider>(context);
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
                    providersProduct.updateQuery('');

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InventoryHomeScreen()));
                  },
                  text: ''),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Productos',
                        style: themeProvider.theme.textTheme.titleLarge),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: SearchFieldFoodDrinkWidget(
                          inventoryType: InventoryType.products,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 550,
                        child: FutureBuilder(
                          future: repository.getproducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              final allFoodDrinks = snapshot.data!;
                              providersProduct.performSearch(allFoodDrinks);

                              // searchModel.performSearch(allFoodDrinks,
                              //     (foodDrink) {
                              //   // Cambia la función de filtro para adaptarse a tu tipo de datos
                              //   return foodDrink.nombre
                              //       .toLowerCase()
                              //       .contains(searchModel.query.toLowerCase());
                              // });
                              return Consumer<ProvidersProducts>(
                                builder: (context, searchModel, child) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: searchModel.searchResults.length,
                                    itemBuilder: (context, index) {
                                      final products =
                                          searchModel.searchResults[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: ContainerFoodDrinkWidget(
                                          nombre: products.nombre,
                                          foto: products.foto,
                                          precio: products.precio,
                                          unidades: products.unidades,
                                          descripcion: products.descripcion,
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Text('El Future es null');
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                          color: themeProvider.theme.cardColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconAdminWidget(
                            fuction: () {
                              showSearchModal(context);
                            },
                            iconData: Icons.filter_alt_outlined,
                            text: 'Filtrar',
                          ),
                          IconAdminWidget(
                            fuction: () {},
                            iconData:
                                Icons.do_not_disturb_on_total_silence_outlined,
                            text: 'Quitar',
                          ),
                          IconAdminWidget(
                            fuction: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const FoodDrinkFormScreen()));
                            },
                            iconData: Icons.add_circle_rounded,
                            text: 'Agregar',
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
