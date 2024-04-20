import 'package:app_barber_yha/domain/models/clients/client.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/inventory/products/products.dart';

class ProvidersSales extends ChangeNotifier {
  Client? _clienteSeleccionado;

  // Método para obtener el cliente seleccionado
  Client? get clienteSeleccionado => _clienteSeleccionado;

  // Método para seleccionar un cliente
  void seleccionarCliente(Client? cliente) {
    _clienteSeleccionado = cliente;
    notifyListeners();
  }

  // Método para deseleccionar el cliente
  void deseleccionarCliente() {
    _clienteSeleccionado = null;
    notifyListeners();
  }

//LISTA DE CLIENTES
  String _query = '';
  List<Client> _searchResults = [];

  String get query => _query;
  List<Client> get searchResults => _searchResults;

  void updateQuery(String newQuery) {
    _query = newQuery;
    notifyListeners();
  }

  void performSearch(List<Client> allFoodDrinks) {
    _searchResults = allFoodDrinks.where((foodDrink) {
      // Filtrar según la consulta
      return foodDrink.nombre.toLowerCase().contains(_query.toLowerCase());
    }).toList();
  }

//LISTA DE PRODUCTOS
  String _queryProducts = '';
  List<Product> _searchResultsProducts = [];

  String get queryProducts => _queryProducts;
  List<Product> get searchResultsProducts => _searchResultsProducts;

  void updateQueryProducts(String newQuery) {
    _queryProducts = newQuery;
    notifyListeners();
  }

  void performSearchProducts(List<Product> allProducts) {
    _searchResultsProducts = allProducts.where((allProducts) {
      // Filtrar según la consulta y la categoría
      return allProducts.nombre
          .toLowerCase()
          .contains(_queryProducts.toLowerCase());
    }).toList();
  }

  //CARRITO DE COMPRAS
  List<Product> _productosSeleccionados = [];

  // Método para obtener la lista de productos seleccionados
  List<Product> get productosSeleccionados => _productosSeleccionados;

  // Método para agregar un producto al carrito
  Future<void> addProductShoppingCart(Product producto) async {
    producto.unidades = 1;
    // Simulación de una operación asíncrona (puede ser una llamada a una API)
    await Future.delayed(Duration(seconds: 1));
    _productosSeleccionados.add(producto);
    notifyListeners();
  }

  void performShoppingCart(List<Product> allProducts) {
    _productosSeleccionados = allProducts.where((allProducts) {
      // Filtrar según la consulta y la categoría
      return allProducts.nombre.toLowerCase().contains(_query.toLowerCase());
    }).toList();
  }

  // Método para remover un producto del carrito
  Future<void> removerProductShoppingCart(Product producto) async {
    // Simulación de una operación asíncrona (puede ser una llamada a una API)
    await Future.delayed(const Duration(seconds: 1));
    _productosSeleccionados.remove(producto);
    notifyListeners();
  }

  // Función para calcular el total del carrito
  int calcularTotalCarrito() {
    int total = 0;
    for (Product product in _productosSeleccionados) {
      total += product.precio;
    }
    return total;
  }

  // Función para vaciar el carrito de compras y quitar el cliente seleccionado
  void vaciarCarritoYQuitarCliente() {
    _productosSeleccionados = [];
    _clienteSeleccionado = null;
  }
}
