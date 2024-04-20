// mock_barbero_repository.dart
import 'package:app_barber_yha/domain/models/clients/client.dart';

class ClientRepository implements ClientsRepository {
  @override
  Future<List<Client>> getClients() async {
    // Aquí retornarías una lista de barberos de prueba
    return [
      Client(
          nombre: 'Orlando Ariza',
          telefono: '556-456-7890',
          foto: 'assets/img/test_user.png'),
      Client(
          nombre: 'Pedro Perez',
          telefono: '987-654-3210',
          foto: 'assets/img/test_user.png'),
      Client(
          nombre: 'Luis Guitierrez',
          telefono: '123-456-7890',
          foto: 'assets/img/test_user.png'),

      // Agrega más barberos según sea necesario
    ];
  }
}
