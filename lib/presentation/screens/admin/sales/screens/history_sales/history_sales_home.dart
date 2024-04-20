import 'package:app_barber_yha/domain/models/sales/sales.dart';
import 'package:app_barber_yha/infrasctructure/repositories/clients/client_repository.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/sales_home_screen.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/screens/history_sales/providers/providers_history_sales.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/screens/history_sales/screens/detail_history_sale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/icon_inventory_widget.dart';
import 'widgets/container_history_sales.dart';
import 'widgets/search_history_sales_widget.dart';

class HistorySalesHome extends StatefulWidget {
  const HistorySalesHome({super.key});

  @override
  State<HistorySalesHome> createState() => _HistorySalesHomeState();
}

final ClientRepository repository = ClientRepository();

class _HistorySalesHomeState extends State<HistorySalesHome> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providersHistorySales = Provider.of<ProvidersHistorySales>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconAdminWidget(
                  iconData: Icons.arrow_back_ios,
                  fuction: () {
                    providersHistorySales.updateQuerySales('');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SalesHomeScreen()));
                  },
                  text: ''),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Historial de Ventas',
                        style: themeProvider.theme.textTheme.titleLarge),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchHistorySalesWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 600,
                        child: FutureBuilder<List<Sale>>(
                            future: Future.value(
                                providersHistorySales.obtenerHistorialVentas()),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              // Si hay datos disponibles, muestra el mensaje
                              else if (snapshot.hasData) {
                                final allSales = snapshot.data!;
                                providersHistorySales
                                    .performSearchHistorySales(allSales);
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: providersHistorySales
                                      .searchResultsSales.length,
                                  itemBuilder: (context, index) {
                                    final sale = allSales[index];
                                    return Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: ContainerHistorySales(
                                          sale: sale,
                                        ));
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return const Text('El Future es null');
                              }
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
