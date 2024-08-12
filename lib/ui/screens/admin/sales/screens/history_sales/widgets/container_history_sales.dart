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

    Duration diferencia = DateTime.now().difference(sale.fecha);
    String tiempoTranscurrido = '';

    if (diferencia.inDays > 0) {
      tiempoTranscurrido = 'Realizado hace ${diferencia.inDays} día(s)';
    } else if (diferencia.inHours > 0) {
      tiempoTranscurrido = 'Realizado hace ${diferencia.inHours} hora(s)';
    } else if (diferencia.inMinutes > 0) {
      tiempoTranscurrido = 'Realizado hace ${diferencia.inMinutes} minuto(s) ';
    } else {
      tiempoTranscurrido = ' Realizado Hace un momento';
    }

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
                      return Text(tiempoTranscurrido,
                          style: themeProvider.theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.normal));
                    } else {
                      return Text(
                        tiempoTranscurrido,
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
