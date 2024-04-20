// barbero.dart
class Client {
  final String nombre;
  final String telefono;
  final String foto;

  Client({
    required this.foto,
    required this.nombre,
    required this.telefono,
  });
}

// Client_repository.dart
abstract class ClientsRepository {
  Future<List<Client>> getClients();
}
