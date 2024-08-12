import 'package:app_barber_yha/domain/models/user/user.dart';

class AuthModelRequest {
  String phone;
  String password;

  AuthModelRequest({
    required this.phone,
    required this.password,
  });
}

class AuthModelResponse {
  UserModelResponse user;
  String token;
  AuthModelResponse({
    required this.user,
    required this.token,
  });
}
