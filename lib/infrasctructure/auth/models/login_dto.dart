class LoginRequestDTO {
  final String phone;
  final String password;

  LoginRequestDTO({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
      };
}

class LoginResponseDTO {
  final String id;
  final String name;
  final String phone;
  // Agrega aquí otros campos que devuelva tu API

  LoginResponseDTO({
    required this.id,
    required this.name,
    required this.phone,
    // Inicializa aquí otros campos
  });

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) {
    return LoginResponseDTO(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      // Mapea aquí otros campos
    );
  }
}
