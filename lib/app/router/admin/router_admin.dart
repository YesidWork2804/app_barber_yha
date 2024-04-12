import 'package:app_barber_yha/presentation/screens/admin/home/home_admin_screen.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/screens/admin/admin_barber/admin_barber.dart';

// GoRoute routesAdmin = GoRoute(
//     path: 'admin_home', routes: [GoRoute(path: '/admin_home/inventario')]);

GoRoute routesAdmin = GoRoute(
    path: '/admin/home', builder: (context, state) => const HomeAdminScreen());

//Barbero
GoRoute routesBarberAdmin = GoRoute(
    path: '/admin/barber',
    builder: (context, state) => const AdminBarbersScreen());
// GoRoute routesAdminInfoBarber = GoRoute(
//     path: '/admin/barber/info_barber',
//     builder: (context, state) => const AdminBarberInfo());
