// barbero.dart
class Clients {
  final String nombre;
  final String telefono;
  final String foto;

  Clients({
    required this.foto,
    required this.nombre,
    required this.telefono,
  });
}

// Client_repository.dart
abstract class ClientsRepository {
  Future<List<Clients>> getClients();
}
