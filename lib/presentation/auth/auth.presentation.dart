import 'package:app_barber_yha/domain/auth/usecase/login.usecase.service.dart';
import 'package:app_barber_yha/infrasctructure/auth/services/auth.service.dart';

final authAPi = LoginUseCase(AuthService());
