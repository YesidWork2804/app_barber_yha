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

  void performSearch(List<Product> allProducts) {
    _searchResults = allProducts.where((products) {
      // Filtrar según la consulta
      return products.nombre.toLowerCase().contains(_query.toLowerCase());
    }).toList();
  }
}
