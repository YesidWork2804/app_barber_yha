import 'package:app_barber_yha/domain/models/inventory/food_drink/food_drink.dart';
import 'package:app_barber_yha/infrasctructure/repositories/inventario/foodDrink/food_drink_repositorie.dart';
import 'package:app_barber_yha/presentation/providers/theme/app_theme_provider.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/widgets/container_filter_widget.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/container_food_drink_widget.dart';
import '../../widgets/icon_inventory_widget.dart';
import '../../widgets/search_form_field_widget.dart';
import 'food_drink_form_screen.dart';
import 'providers/providers_food_drink.dart';

class FoodDrinkScreen extends StatelessWidget {
  const FoodDrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodDrinkRepository repository = FoodDrinkRepository();
    final searchModel = Provider.of<ProvidersFoodDrink>(
      context,
    ); // Obtén el modelo de búsqueda desde el proveedor

    final themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const ButtonTopNavigatorWidget(
              buttonUser: false,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Comidas y Bebidas',
                        style: themeProvider.theme.textTheme.titleLarge),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: SearchFormFieldWidget()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 550,
                        child: FutureBuilder(
                          future: repository.getFoodDrink(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasData) {
                              final allFoodDrinks = snapshot.data!;
                              searchModel.performSearch(allFoodDrinks,
                                  (foodDrink) {
                                // Cambia la función de filtro para adaptarse a tu tipo de datos
                                return foodDrink.nombre
                                    .toLowerCase()
                                    .contains(searchModel.query.toLowerCase());
                              });
                              return Consumer<ProvidersFoodDrink>(
                                builder: (context, searchModel, child) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: searchModel.searchResults.length,
                                    itemBuilder: (context, index) {
                                      final foodDrink =
                                          searchModel.searchResults[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: ContainerFoodDrinkWidget(
                                          nombre: foodDrink.nombre,
                                          foto: foodDrink.foto,
                                          precio: foodDrink.precio,
                                          unidades: foodDrink.unidades,
                                          descripcion: foodDrink.descripcion,
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
                          IconInventoryWidget(
                            fuction: () {
                              showSearchModal(context);
                            },
                            iconData: Icons.filter_alt_outlined,
                            text: 'Filtrar',
                          ),
                          IconInventoryWidget(
                            fuction: () {},
                            iconData:
                                Icons.do_not_disturb_on_total_silence_outlined,
                            text: 'Quitar',
                          ),
                          IconInventoryWidget(
                            fuction: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FoodDrinkFormScreen()));
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
