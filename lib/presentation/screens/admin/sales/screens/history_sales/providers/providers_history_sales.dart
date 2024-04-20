import 'dart:math';

import 'package:app_barber_yha/domain/models/clients/client.dart';
import 'package:app_barber_yha/domain/models/inventory/products/products.dart';
import 'package:app_barber_yha/domain/models/sales/sales.dart';

import 'package:flutter/material.dart';

class ProvidersHistorySales extends ChangeNotifier {
  // List<SaleFast> _historialVentasRapidas = [];

  final List<Sale> _historialVentas = [];
  List<Sale> get historialVentas => _historialVentas;

  void endSaleCustomer(
      {Client? client,
      required List<Product> listProduct,
      required int total}) {
    SaleClient ventClient = SaleClient(
      ref: generarCodigo(),
      cliente: client,
      productos: listProduct,
      total: total,
      fecha: DateTime.now(),
    );
    _historialVentas.add(ventClient);
  }

  void endQuickSale({required List<Product> listProduct, required int total}) {
    SaleFast ventFast = SaleFast(
      ref: generarCodigo(),
      productos: listProduct,
      total: total,
      fecha: DateTime.now(),
    );
    _historialVentas.add(ventFast);
  }

  // Función para obtener el historial de ventas
  List<Sale> obtenerHistorialVentas() {
    return _historialVentas;
  }

  //LISTA DE Historial de Ventas

  String _querySales = '';
  List<Sale> _searchResultsSales = [];

  String get querySales => _querySales;
  List<Sale> get searchResultsSales => _searchResultsSales;

  void updateQuerySales(String newQuery) {
    _querySales = newQuery;
    notifyListeners();
  }

  void performSearchHistorySales(List<Sale> allSales) {
    _searchResultsSales = allSales.where((venta) {
      // Filtrar según la consulta y los criterios de búsqueda
      return venta.ref.toLowerCase().contains(_querySales.toLowerCase());
    }).toList();
  }
}

String generarCodigo() {
  // Creamos un objeto Random para generar números aleatorios
  Random random = Random();

  // Creamos una lista de caracteres numéricos del 0 al 9
  List<String> numeros = List.generate(10, (index) => index.toString());

  // Barajamos la lista para obtener una secuencia aleatoria de números
  numeros.shuffle();

  // Tomamos los primeros 6 elementos de la lista barajada
  List<String> numerosAleatorios = numeros.sublist(0, 6);

  // Unimos los elementos de la lista para formar una cadena de texto
  String codigo = numerosAleatorios.join('');

  return codigo;
}
