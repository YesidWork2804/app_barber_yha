import 'package:app_barber_yha/presentation/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

import 'admin/router_admin.dart';

final goRouter = GoRouter(
  initialLocation: '/login',

  // Ruta inicial
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

    // Rutas Admin
    routesAdmin
  ],
);
