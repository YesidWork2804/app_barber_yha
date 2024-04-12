// mock_barbero_repository.dart

import 'package:app_barber_yha/domain/models/inventory/food_drink/food_drink.dart';

class FoodDrinkRepository implements FoodDrinksRepository {
  @override
  Future<List<FoodDrink>> getFoodDrink() async {
    // Aquí retornarías una lista de barberos de prueba
    return [
      FoodDrink(
          nombre: 'Coca Cola - Personal',
          foto: 'assets/img/drinkFood/logo_cola.png',
          precio: 3100,
          unidades: 1,
          descripcion: ''),
      FoodDrink(
          nombre: 'Pepsi - Personal',
          foto: 'assets/img/drinkFood/logo_pepsi.png',
          precio: 1111,
          unidades: 12,
          descripcion: ''),
      FoodDrink(
          nombre: 'Detodito',
          foto: 'assets/img/drinkFood/logo_papas.png',
          precio: 1300,
          unidades: 10,
          descripcion: ''),
      FoodDrink(
          nombre: 'Corona Extra',
          foto: 'assets/img/drinkFood/logo_cerveza.png',
          precio: 1200,
          unidades: 98,
          descripcion: ''),
      FoodDrink(
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
