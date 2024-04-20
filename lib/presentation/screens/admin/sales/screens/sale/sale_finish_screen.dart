import 'package:app_barber_yha/presentation/screens/admin/sales/screens/sale/info_sales_screen.dart';
import 'package:app_barber_yha/presentation/widgets/app/button_app_widget.dart';

import 'package:app_barber_yha/presentation/widgets/app/title_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/providers.dart';
import '../../providers/providers_sales.dart';
import '../history_sales/providers/providers_history_sales.dart';

class SalesFinishScreen extends StatelessWidget {
  const SalesFinishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providersSales = Provider.of<ProvidersSales>(context);
    final providershistorySales = Provider.of<ProvidersHistorySales>(context);

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const TitleIconWidget(),
            Text(
              'Venta Realizada',
              style: themeProvider.theme.textTheme.bodyLarge
                  ?.copyWith(fontSize: 35),
            ),
            Image.asset('assets/img/check_logo.png'),
            ButtonAppWidget(
              labelButton: 'Volver al Inicio',
              fuction: () {
                // print(providersSales.productosSeleccionados.length);
                if (providersSales.clienteSeleccionado != null) {
                  providershistorySales.endSaleCustomer(
                      client: providersSales.clienteSeleccionado!,
                      listProduct: providersSales.productosSeleccionados,
                      total: providersSales.calcularTotalCarrito());
                } else {
                  providershistorySales.endQuickSale(
                      listProduct: providersSales.productosSeleccionados,
                      total: providersSales.calcularTotalCarrito());
                }
                providersSales.vaciarCarritoYQuitarCliente();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InfoSalesScreen()));
              },
            )
            // MyIconAppWidget(
            //   icon: Icons.check,
            //   fuction: () {},
            //   size: 400,
            // ),
            // Icon(
            //   Icons.check,
            //   weight: 100,
            //   size: 400,
            // )
          ],
        ),
      )),
    );
  }
}
