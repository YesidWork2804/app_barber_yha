import 'package:app_barber_yha/domain/models/clients/client.dart';

import '../inventory/products/products.dart';

// class Sale {
//   final Client? cliente;
//   final List<Product> productos;
//   final int total;
//   final DateTime fecha;

//   Sale({
//     required this.cliente,
//     required this.productos,
//     required this.total,
//     required this.fecha,
//   });
// }

abstract class Sale {
  final List<Product> productos;
  final int total;
  final DateTime fecha;
  final String ref;

  Sale({
    required this.ref,
    required this.productos,
    required this.total,
    required this.fecha,
  });
}

class SaleClient extends Sale {
  final Client? cliente;

  SaleClient({
    required List<Product> productos,
    required int total,
    required DateTime fecha,
    required String ref,
    this.cliente,
  }) : super(
          ref: ref,
          productos: productos,
          total: total,
          fecha: fecha,
        );
}

class SaleFast extends Sale {
  SaleFast({
    required List<Product> productos,
    required int total,
    required DateTime fecha,
    required String ref,
  }) : super(
          ref: ref,
          productos: productos,
          total: total,
          fecha: fecha,
        );
}
