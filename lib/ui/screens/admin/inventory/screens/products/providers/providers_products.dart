import 'package:app_barber_yha/domain/models/inventory/products/products.dart';
import 'package:flutter/material.dart';

class ProvidersProducts extends ChangeNotifier {
  String _query = '';
  List<Product> _searchResults = [];

  String get query => _query;
  List<Product> get searchResults => _searchResults;

  void updateQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  void performSearch(List<Product> allFoodDrinks) {
    _searchResults = allFoodDrinks.where((foodDrink) {
      // Filtrar según la consulta y la categoría
      return foodDrink.nombre.toLowerCase().contains(_query.toLowerCase()) &&
          foodDrink.category.toLowerCase() == 'article';
    }).toList();
  }
}
