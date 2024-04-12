// barbero.dart
class FoodDrink {
  final String nombre;
  final int precio;
  final int unidades;
  final String foto;
  final String descripcion;

  FoodDrink({
    required this.descripcion,
    required this.foto,
    required this.nombre,
    required this.precio,
    required this.unidades,
  });
}

// FoodDrink_repository.dart
abstract class FoodDrinksRepository {
  Future<List<FoodDrink>> getFoodDrink();
}
