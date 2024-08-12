import 'package:app_barber_yha/domain/auth/models/auth.dart.dart';

abstract class AuthGateway {
  Future<LoginModelResponse> login(LoginModelRequest login);
}
