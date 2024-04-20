import 'package:app_barber_yha/domain/models/sales/sales.dart';
import 'package:app_barber_yha/infrasctructure/repositories/clients/client_repository.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/screens/history_sales/history_sales_home.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/screens/history_sales/providers/providers_history_sales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../inventory/widgets/inventory_widgets.dart';

class DeatilHistorySale extends StatefulWidget {
  final Sale sale;

  const DeatilHistorySale({super.key, required this.sale});

  @override
  State<DeatilHistorySale> createState() => _DeatilHistorySaleState();
}

final ClientRepository repository = ClientRepository();

class _DeatilHistorySaleState extends State<DeatilHistorySale> {
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
                            builder: (context) => const HistorySalesHome()));
                  },
                  text: ''),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text('Detallle de Venta',
                      style: themeProvider.theme.textTheme.titleLarge),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Productos',
                            style: themeProvider.theme.textTheme.bodyMedium),
                        SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: widget.sale.productos.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: ContainerFoodDrinkArticleWidget(
                                    foto: widget.sale.productos[index].foto,
                                    nombre: widget.sale.productos[index].nombre,
                                    precio: widget.sale.productos[index].precio,
                                    unidades:
                                        widget.sale.productos[index].unidades),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Total',
                                style:
                                    themeProvider.theme.textTheme.bodyMedium),
                            Text('\$${widget.sale.total}',
                                style: themeProvider.theme.textTheme.bodyLarge),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                '${widget.sale.fecha.day}/${widget.sale.fecha.month}/${widget.sale.fecha.year} ',
                                style:
                                    themeProvider.theme.textTheme.bodyMedium),
                            Text(
                                '${widget.sale.fecha.hour}:${widget.sale.fecha.minute}',
                                style: themeProvider.theme.textTheme.bodyLarge),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
