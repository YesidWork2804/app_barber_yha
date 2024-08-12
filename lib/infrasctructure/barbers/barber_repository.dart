// mock_barbero_repository.dart
import 'package:app_barber_yha/domain/models/barbers/barber.dart';

class BarberRepository implements BarbersRepository {
  @override
  Future<List<Barbers>> getBarbers() async {
    // Aquí retornarías una lista de barberos de prueba
    return [
      Barbers(
          nombre: 'Orlando Ariza',
          telefono: '556-456-7890',
          cantidadTurnos: 3,
          estaActivo: true,
          foto: 'assets/img/test_user.png'),
      Barbers(
          nombre: 'Pedro Perez',
          telefono: '987-654-3210',
          cantidadTurnos: 0,
          estaActivo: false,
          foto: 'assets/img/test_user.png'),
      Barbers(
          nombre: 'Luis Guitierrez',
          telefono: '123-456-7890',
          cantidadTurnos: 1,
          estaActivo: true,
          foto: 'assets/img/test_user.png'),

      // Agrega más barberos según sea necesario
    ];
  }
}
