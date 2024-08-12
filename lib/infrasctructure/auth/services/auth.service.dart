import '../../../domain/auth/gateways/auth.gateway.dart';
import '../../../domain/auth/models/auth.dart.dart';

class AuthService implements AuthGateway {
  @override
  Future<LoginModelResponse> login(LoginModelRequest request) async {
    return LoginModelResponse(
      userId: '123',
      name: 'Yesid',
      phone: '123456789',
    );
  }
}
