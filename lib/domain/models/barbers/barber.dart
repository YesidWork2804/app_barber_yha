// barbero.dart
class Barbers {
  final String nombre;
  final String telefono;
  final int cantidadTurnos;
  final bool estaActivo;
  final String foto;

  Barbers({
    required this.foto,
    required this.nombre,
    required this.telefono,
    required this.cantidadTurnos,
    required this.estaActivo,
  });
}

// Barbers_repository.dart
abstract class BarbersRepository {
  Future<List<Barbers>> getBarbers();
}
