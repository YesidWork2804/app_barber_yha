import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/screens/food_drink/providers/providers_food_drink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchFormFieldWidget extends StatefulWidget {
  const SearchFormFieldWidget({super.key});

  @override
  State<SearchFormFieldWidget> createState() => _SearchFormFieldWidgetState();
}

class _SearchFormFieldWidgetState extends State<SearchFormFieldWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   print('Widget initialized');
  // }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final searchModel = Provider.of<ProvidersFoodDrink>(context, listen: false);
    final TextEditingController _searchController = TextEditingController();

    return TextFormField(
      controller: _searchController,
      onChanged: (value) {
        searchModel.updateQuery(
            value); // Actualiza la consulta en el modelo de búsqueda
        if (_searchController.text == '') {
          _searchController.clear();
          searchModel.updateQuery('');
        }
      },
      focusNode: FocusNode(),
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
              searchModel.updateQuery('');
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
