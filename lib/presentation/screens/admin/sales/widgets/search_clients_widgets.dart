import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/screens/food_drink/providers/providers_food_drink.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/providers/providers_sales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchClientsWidget extends StatefulWidget {
  const SearchClientsWidget({super.key});

  @override
  State<SearchClientsWidget> createState() => _SearchClientsWidgetState();
}

class _SearchClientsWidgetState extends State<SearchClientsWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    final providersFoodDrink =
        Provider.of<ProvidersSales>(context, listen: false);

    return TextFormField(
      controller: _searchController,
      onChanged: (value) {
        providersFoodDrink.updateQuery(
            value); // Actualiza la consulta en el modelo de búsqueda
        if (_searchController.text == '') {
          _searchController.clear();
          providersFoodDrink.updateQuery('');
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
              providersFoodDrink.updateQuery('');
            }),
        hintText: 'Buscar',
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
