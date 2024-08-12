import 'package:app_barber_yha/domain/auth/models/auth.dart.dart';

import '../models/login_dto.dart';

class LoginMapper {
  static LoginRequestDTO toDTO(LoginModelRequest domain) {
    return LoginRequestDTO(
      phone: domain.phone,
      password: domain.password,
    );
  }

  static LoginModelResponse fromDTO(LoginResponseDTO dto) {
    return LoginModelResponse(
      userId: dto.id,
      name: dto.name,
      phone: dto.phone,
      // Mapea aquí otros campos
    );
  }
}
