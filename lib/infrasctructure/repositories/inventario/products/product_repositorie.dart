// mock_barbero_repository.dart
import '../../../../domain/models/inventory/products/products.dart';

class ProductRepository implements ProductsRepository {
  @override
  Future<List<Product>> getproducts() async {
    // Aquí retornarías una lista de barberos de prueba
    return [
      Product(
          nombre: 'Crema para peinar',
          foto: 'assets/img/products/logo_crema.png',
          precio: 3100,
          unidades: 1,
          descripcion:
              'Es hidratada y con un aspecto saludable. También puede ser útil para reducir la picazón y la irritación asociadas con el crecimiento de la barba.'),
      Product(
          nombre: 'Locion para barba',
          foto: 'assets/img/products/logo_locion.png',
          precio: 3100,
          unidades: 1,
          descripcion:
              'Es un producto útil para hombres con barba que desean mantenerla suave, hidratada y con un aspecto saludable. También puede ser útil para reducir la picazón y la irritación asociadas con el crecimiento de la barba.'),
      Product(
          nombre: 'Tinte para cabello',
          foto: 'assets/img/products/logo_tinte.png',
          precio: 3100,
          unidades: 1,
          descripcion:
              'Es un producto útil para hombres con barba que desean mantenerla suave, hidratada y con un aspecto saludable. También puede ser útil para reducir .'),

      // Agrega más barberos según sea necesario
    ];
  }
}
