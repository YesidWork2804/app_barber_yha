import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/screens/products/providers/providers_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../screens/food_drink/providers/providers_food_drink.dart';

enum InventoryType { foodDrink, products }

class SearchFieldFoodDrinkWidget extends StatefulWidget {
  final InventoryType inventoryType;
  const SearchFieldFoodDrinkWidget({super.key, required this.inventoryType});

  @override
  State<SearchFieldFoodDrinkWidget> createState() =>
      _SearchFieldFoodDrinkWidgetState();
}

class _SearchFieldFoodDrinkWidgetState
    extends State<SearchFieldFoodDrinkWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    final searchModelProducts =
        Provider.of<ProvidersProducts>(context, listen: false);
    final searchModelFoodDrink =
        Provider.of<ProvidersFoodDrink>(context, listen: false);

    return TextFormField(
      controller: _searchController,
      onChanged: (value) {
        if (widget.inventoryType == InventoryType.foodDrink) {
          searchModelFoodDrink.updateQuery(
              value); // Actualiza la consulta en el modelo de búsqueda
          if (_searchController.text == '') {
            _searchController.clear();
            searchModelFoodDrink.updateQuery('');
          }
        } else if (widget.inventoryType == InventoryType.products) {
          searchModelProducts.updateQuery(
              value); // Actualiza la consulta en el modelo de búsqueda
          if (_searchController.text == '') {
            _searchController.clear();
            searchModelProducts.updateQuery('');
          }
        }
      },
      style: themeProvider.theme.textTheme.displayMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: themeProvider.theme.cardColor,
        prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: AppTheme.colorButton,
            onPressed: () {}),
        suffixIcon: IconButton(
            icon: const Icon(
              Icons.do_not_disturb_on_outlined,
              color: AppTheme.colorButton,
            ),
            onPressed: () {
              _searchController.clear();
              if (widget.inventoryType == InventoryType.foodDrink) {
                searchModelFoodDrink.updateQuery('');
              } else if (widget.inventoryType == InventoryType.products) {
                searchModelProducts.updateQuery('');
              }
            }),
        hintText: 'Ingresa tu búsqueda',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Radio del borde
          borderSide: const BorderSide(
            color: Colors.transparent,
          ), // Grosor y color del borde
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.colorButton),
        ),
      ),
    );
  }
}
