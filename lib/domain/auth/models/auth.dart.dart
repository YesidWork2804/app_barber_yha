class LoginModelRequest {
  final String phone;
  final String password;

  LoginModelRequest(this.phone, this.password);
}

class LoginModelResponse {
  final String userId;
  final String name;
  final String phone;
  final String? token;
  final String? rol;
  // Agrega aquí otros campos que devuelva tu API

  LoginModelResponse({
    required this.userId,
    required this.name,
    required this.phone,
    this.token,
    this.rol,
  });
}
