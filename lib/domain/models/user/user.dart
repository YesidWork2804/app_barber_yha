class UserModelRequest {
  String name;
  String email;
  String phone;
  String password;

  UserModelRequest({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class UserModelResponse {
  String id;
  String name;
  String email;
  String phone;
  String role;

  UserModelResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });
}
