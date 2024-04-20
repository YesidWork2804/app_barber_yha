import 'package:app_barber_yha/domain/models/sales/sales.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../providers/providers.dart';
import '../screens/detail_history_sale.dart';

class ContainerHistorySales extends StatelessWidget {
  final Sale sale;
  // final VoidCallback ontap;
  const ContainerHistorySales({
    super.key,
    required this.sale,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: () {
        // print(sale.productos.length);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DeatilHistorySale(
                      sale: sale,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(color: themeProvider.theme.cardColor),
        width: 250,
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  () {
                    if (sale is SaleClient) {
                      SaleClient ventClient = sale as SaleClient;
                      return Text(ventClient.cliente!.nombre,
                          style: themeProvider.theme.textTheme.bodyMedium);
                    } else {
                      return const SizedBox();
                    }
                  }(),
                  () {
                    if (sale is SaleClient) {
                      return Text(
                          'Realizado ${sale.fecha.year}/${sale.fecha.month}/${sale.fecha.day} - ${sale.fecha.hour}:${sale.fecha.minute}',
                          style: themeProvider.theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.normal));
                    } else {
                      return Text(
                        'Realizado ${sale.fecha.year}/${sale.fecha.month}/${sale.fecha.day} - ${sale.fecha.hour}:${sale.fecha.minute}',
                        style: themeProvider.theme.textTheme.bodyMedium,
                      );
                    }
                  }(),
                ],
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/img/history_sale.png', width: 70),
                  Text('\$${sale.total}',
                      style: themeProvider.theme.textTheme.bodyLarge
                          ?.copyWith(fontSize: 30)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
