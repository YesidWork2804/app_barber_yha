import 'package:app_barber_yha/domain/models/clients/client.dart';
import 'package:flutter/material.dart';

class ProvidersSales extends ChangeNotifier {
  Clients? _clienteSeleccionado;

  // Método para obtener el cliente seleccionado
  Clients? get clienteSeleccionado => _clienteSeleccionado;

  // Método para seleccionar un cliente
  void seleccionarCliente(Clients cliente) {
    _clienteSeleccionado = cliente;
    notifyListeners();
  }

  // Método para deseleccionar el cliente
  void deseleccionarCliente() {
    _clienteSeleccionado = null;
    notifyListeners();
  }

  String _query = '';
  List<Clients> _searchResults = [];

  String get query => _query;
  List<Clients> get searchResults => _searchResults;

  void updateQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  void performSearch(List<Clients> allFoodDrinks) {
    _searchResults = allFoodDrinks.where((foodDrink) {
      // Filtrar según la consulta
      return foodDrink.nombre.toLowerCase().contains(_query.toLowerCase());
    }).toList();
  }
}
