// mock_barbero_repository.dart

import '../../../domain/models/admin/admin.dart';

class AdminRepository implements AdminsRepository {
  @override
  Future<List<Admins>> getAdmins() async {
    // Aquí retornarías una lista de barberos de prueba
    return [
      Admins(
          nombre: 'Yan H',
          foto: 'assets/img/test_barbero2.png',
          telefono: '123'),
      Admins(
          nombre: 'Yeison H',
          foto: 'assets/img/test_barbero2.png',
          telefono: '1234'),
      Admins(
          nombre: 'Yesid H',
          foto: 'assets/img/test_user.png',
          telefono: '12345'),
      // Agrega más barberos según sea necesario
    ];
  }
}
