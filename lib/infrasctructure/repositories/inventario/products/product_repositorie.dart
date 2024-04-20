// mock_barbero_repository.dart
import '../../../../domain/models/inventory/products/products.dart';

class ProductRepository implements ProductsRepository {
  @override
  Future<List<Product>> getproducts() async {
    // Aquí retornarías una lista de barberos de prueba
    return [
      Product(
          category: 'article',
          nombre: 'Crema para peinar',
          foto: 'assets/img/products/logo_crema.png',
          precio: 3100,
          unidades: 62,
          descripcion:
              'Es hidratada y con un aspecto saludable. También puede ser útil para reducir la picazón y la irritación asociadas con el crecimiento de la barba.'),
      Product(
          category: 'article',
          nombre: 'Locion para barba',
          foto: 'assets/img/products/logo_locion.png',
          precio: 3100,
          unidades: 12,
          descripcion:
              'Es un producto útil para hombres con barba que desean mantenerla suave, hidratada y con un aspecto saludable. También puede ser útil para reducir la picazón y la irritación asociadas con el crecimiento de la barba.'),
      Product(
          category: 'article',
          nombre: 'Tinte para cabello',
          foto: 'assets/img/products/logo_tinte.png',
          precio: 3100,
          unidades: 1,
          descripcion:
              'Es un producto útil para hombres con barba que desean mantenerla suave, hidratada y con un aspecto saludable. También puede ser útil para reducir .'),
      Product(
          category: 'foodDrink',
          nombre: 'Coca Cola - Personal',
          foto: 'assets/img/drinkFood/logo_cola.png',
          precio: 3100,
          unidades: 1,
          descripcion: ''),
      Product(
          category: 'foodDrink',
          nombre: 'Pepsi - Personal',
          foto: 'assets/img/drinkFood/logo_pepsi.png',
          precio: 1111,
          unidades: 12,
          descripcion: ''),
      Product(
          category: 'foodDrink',
          nombre: 'Detodito',
          foto: 'assets/img/drinkFood/logo_papas.png',
          precio: 1300,
          unidades: 10,
          descripcion: ''),
      Product(
          category: 'foodDrink',
          nombre: 'Corona Extra',
          foto: 'assets/img/drinkFood/logo_cerveza.png',
          precio: 1200,
          unidades: 98,
          descripcion: ''),
      Product(
          category: 'foodDrink',
          nombre: 'Coca Cola - Personal',
          foto: 'assets/img/drinkFood/logo_cola.png',
          precio: 3100,
          unidades: 1,
          descripcion:
              'Es un producto útil para hombres con barba que desean mantenerla suave, hidratada y con un aspecto saludable. También puede ser útil para reducir la picazón y la irritación asociadas con el crecimiento de la barba.'),
      // Agrega más barberos según sea necesario
    ];
  }
}
