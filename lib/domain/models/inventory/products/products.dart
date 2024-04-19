// barbero.dart
class Product {
  final String nombre;
  final int precio;
  final int unidades;
  final String foto;
  final String descripcion;
  final String category;

  Product({
    required this.category,
    required this.descripcion,
    required this.foto,
    required this.nombre,
    required this.precio,
    required this.unidades,
  });
}

// Product_repository.dart
abstract class ProductsRepository {
  Future<List<Product>> getproducts();
}
