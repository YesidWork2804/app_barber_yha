import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/screens/history_sales/providers/providers_history_sales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchHistorySalesWidget extends StatefulWidget {
  const SearchHistorySalesWidget({super.key});

  @override
  State<SearchHistorySalesWidget> createState() =>
      _SearchHistorySalesWidgetState();
}

class _SearchHistorySalesWidgetState extends State<SearchHistorySalesWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    final providersHistorySales =
        Provider.of<ProvidersHistorySales>(context, listen: false);

    return TextFormField(
      controller: _searchController,
      onChanged: (value) {
        providersHistorySales.updateQuerySales(
            value); // Actualiza la consulta en el modelo de búsqueda
        if (_searchController.text == '') {
          _searchController.clear();
          providersHistorySales.updateQuerySales('');
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
              providersHistorySales.updateQuerySales('');
            }),
        hintText: 'Buscar por Referencia',
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
