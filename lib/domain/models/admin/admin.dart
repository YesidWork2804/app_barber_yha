// barbero.dart
class Admins {
  final String nombre;
  final String foto;
  final String telefono;

  Admins({
    required this.telefono,
    this.foto = '',
    this.nombre = '',
  });
}

// Barbers_repository.dart
abstract class AdminsRepository {
  Future<List<Admins>> getAdmins();
}
