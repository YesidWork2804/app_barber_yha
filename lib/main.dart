import 'package:app_barber_yha/app/router/routes_app.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/screens/products/providers/providers_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/providers/providers.dart';
import 'presentation/screens/admin/inventory/screens/food_drink/providers/providers_food_drink.dart';
import 'presentation/screens/admin/sales/providers/providers_sales.dart';
import 'presentation/screens/admin/sales/screens/history_sales/providers/providers_history_sales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvidersApp(),
        ),
        //Providers Inventory
        ChangeNotifierProvider(
          create: (_) => ProvidersFoodDrink(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvidersProducts(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvidersSales(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProvidersHistorySales(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.theme,
      routerConfig: goRouter,
      // Proporciona la configuración requerida para la navegación web
    );
  }
}
