import 'package:app_barber_yha/domain/models/inventory/products/products.dart';
import 'package:flutter/material.dart';

class ProvidersFoodDrink extends ChangeNotifier {
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
          foodDrink.category.toLowerCase() == 'fooddrink';
    }).toList();
  }
}

// import 'package:flutter/material.dart';

// class ProvidersFoodDrink<T> extends ChangeNotifier {
//   String _query = '';
//   List<T> _searchResults = [];

//   String get query => _query;
//   List<T> get searchResults => _searchResults;

//   void updateQuery(String newQuery) {
//     _query = newQuery;
//     notifyListeners();
//   }

//   void performSearch(List<T> allItems, bool Function(T) filterFunction) {
//     _searchResults = allItems.where(filterFunction).toList();
//     // notifyListeners();
//   }

//   // // Método para reiniciar los valores del proveedor
//   void resetValues() {
//     _query = ''; // Restablece la consulta
//     notifyListeners(); // Notifica a los escuchadores sobre el cambio en los valores
//   }
// }
