// import 'package:app_barber_yha/config/api_config.dart';
// import 'package:dio/dio.dart';

// class AdminService {
//   final String apiUrl =
//       ApiConfig.apiUrl; // Reemplaza con la dirección IP de tu servidor

//   Future<String> createAdmin(
//       {required name, required password, required phone}) async {
//     final dio = Dio();

//     try {
//       final Map<String, dynamic> requestData = {
//         'name': name,
//         'password': password,
//         'phone': phone,
//       };

//       final response = await dio.post(
//         '$apiUrl/admin',
//         data: requestData,
//       );

//       if (response.statusCode == 201) {
//         return 'Administrador creado exitosamente';
//       } else {
//         // Si el código de estado no es 201, devolvemos el mensaje de error proporcionado por la API
//         final errorMessage = response.data[
//             'message']; // Asumiendo que la API devuelve el mensaje en el campo 'message'
//         return errorMessage != null
//             ? errorMessage.toString()
//             : 'Error desconocido al crear el administrador';
//       }
//     } catch (error) {
//       // Si se produce un error durante la solicitud, devolvemos un mensaje de error
//       return 'Error en la solicitud HTTP: $error';
//     }
//   }
// }
