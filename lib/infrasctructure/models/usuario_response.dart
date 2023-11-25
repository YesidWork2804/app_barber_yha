// En domain/admin.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioResponse {
  final String nombre;
  final String id;
  final String rol;
  final String telefono;
  final String clave;

  UsuarioResponse({
    required this.nombre,
    required this.id,
    required this.rol,
    required this.telefono,
    required this.clave,
  });

  // Método para crear un Usuario desde un documento de Firestore
  factory UsuarioResponse.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UsuarioResponse(
      nombre: data['nombre'] ?? '',
      id: data['id'] ?? '',
      rol: data['rol'] ?? '',
      telefono: data['telefono'] ?? '',
      clave: data['clave'] ?? '',
    );
  }

  // Método para convertir el Usuario a un mapa para almacenar en Firestore
  Map<String, dynamic> toMap() {
    return {
      'telefono': telefono,
      'clave': clave,
    };
  }
}
