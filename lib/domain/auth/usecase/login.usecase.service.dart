import 'package:app_barber_yha/domain/auth/gateways/auth.gateway.dart';
import 'package:app_barber_yha/domain/auth/models/auth.dart.dart';

class LoginUseCase {
  final AuthGateway _authGateway;

  LoginUseCase(this._authGateway);

  Future<LoginModelResponse> login(String phone, String password) {
    final request = LoginModelRequest(phone, password);
    return _authGateway.login(request);
  }
}
