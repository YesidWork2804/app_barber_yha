// En domain/admin.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioLogin {
  final String telefono;
  final String clave;

  UsuarioLogin({
    required this.telefono,
    required this.clave,
  });

  // Método para crear un Usuario desde un documento de Firestore
  factory UsuarioLogin.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UsuarioLogin(
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
