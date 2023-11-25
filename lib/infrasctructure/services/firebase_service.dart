// En data/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  final CollectionReference _collection = FirebaseService.usuarioCollection;

  static Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  static FirebaseFirestore get firestoreInstance => FirebaseFirestore.instance;

  static CollectionReference get usuarioCollection =>
      firestoreInstance.collection('usuarios');

  Future<String?> getRol({required String telefono}) async {
    final querySnapshot = await _collection.get();
    String? rolUsuario;
    for (var element in querySnapshot.docs) {
      if (element['telefono'] == telefono) {
        rolUsuario = element['rol'];
      }
    }
    return rolUsuario;
  }

  Future<bool> logout({required String telefono, required String clave}) async {
    try {
      // Realizar una consulta para verificar si el teléfono existe
      QuerySnapshot querySnapshot = await _collection
          .where('telefono', isEqualTo: telefono)
          .where('clave', isEqualTo: clave)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      print("Error al verificar si el teléfono existe: $error");
      return false;
    }
  }

  Future<void> authenticateWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    // Envía el código de verificación al número de teléfono
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Esto se ejecuta automáticamente si la verificación se completa automáticamente (por ejemplo, en dispositivos de confianza)
        await auth.signInWithCredential(credential);
        print('Usuario autenticado automáticamente: ${auth.currentUser?.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Error en la verificación: $e');
      },
      codeSent: (String verificationId, int? resendToken) async {
        // El código de verificación fue enviado al número de teléfono
        // Puedes enviar este código al usuario y pedirle que lo ingrese en tu interfaz de usuario

        // Supongamos que el usuario ingresa el código manualmente (deberías proporcionar un campo de entrada para esto)
        String smsCode = '123456';

        // Crea una credencial con el código de verificación
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        // Autentica al usuario con la credencial
        await auth.signInWithCredential(credential);

        print('Usuario autenticado manualmente: ${auth.currentUser?.uid}');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Maneja el caso en que el tiempo de espera para la entrada automática del código ha expirado
        print(
            'Tiempo de espera agotado. Código de verificación: $verificationId');
      },
      timeout: Duration(
          seconds:
              60), // Establece el tiempo de espera máximo para la verificación
    );
  }
  // Método para obtener la lista de documentos de una colección
  // static Future<List<DocumentSnapshot>> getCollectionDocuments(
  //     CollectionReference collection) async {
  //   final querySnapshot = await collection.get();
  //   return querySnapshot.docs;
  // }
}
