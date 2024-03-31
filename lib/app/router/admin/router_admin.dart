import 'package:app_barber_yha/presentation/screens/admin/home/home_admin_screen.dart';
import 'package:go_router/go_router.dart';

// GoRoute routesAdmin = GoRoute(
//     path: 'admin_home', routes: [GoRoute(path: '/admin_home/inventario')]);

GoRoute routesAdmin = GoRoute(
    path: '/admin/home', builder: (context, state) => const HomeAdminScreen());
