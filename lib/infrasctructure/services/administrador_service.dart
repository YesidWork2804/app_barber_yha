// En data/admin_repository.dart
import 'package:app_barber_yha/infrasctructure/models/usuario_response.dart';
import 'package:app_barber_yha/infrasctructure/services/firebase_service.dart';
import 'package:app_barber_yha/domain/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/usuario_login_response.dart'; // Asegúrate de importar el modelo Administrador

class UsuarioService implements Repository<UsuarioResponse> {
  final CollectionReference _collection = FirebaseService.usuarioCollection;

  List listAdmin = [];
  @override
  Future<List<UsuarioResponse>> read() async {
    final querySnapshot = await _collection.get();

    final adminList = querySnapshot.docs
        .map((doc) => UsuarioResponse.fromDocumentSnapshot(doc))
        .toList();

    querySnapshot.docs.forEach((element) {
      print(element.data());
    });

    return adminList;
  }

  @override
  Future<void> create(UsuarioResponse item) async {
    final data =
        item.toMap(); // Asegúrate de tener un método toMap en tu modelo
    await _collection.add(data);
  }

  @override
  Future<void> delete(UsuarioResponse item) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(UsuarioResponse item) {
    // TODO: implement update
    throw UnimplementedError();
  }

  // Implementar otras operaciones CRUD específicas para el rol de admin
}
