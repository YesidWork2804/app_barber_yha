import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/screens/container_button_info_screen.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../inventory/widgets/inventory_widgets.dart';
import '../widgets/container_info_sales_screen.dart';
import 'sales_home_screen.dart';

class InfoSalesScreen extends StatefulWidget {
  const InfoSalesScreen({super.key});

  @override
  State<InfoSalesScreen> createState() => _InfoSalesScreenState();
}

bool client = true;

class _InfoSalesScreenState extends State<InfoSalesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    void buttonClient() {
      setState(() {
        client = !client;
        print(client);
      });
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconAdminWidget(
                        iconData: Icons.arrow_back_ios,
                        fuction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SalesHomeScreen(),
                            ),
                          );
                        },
                        text: '',
                      ),
                    ),
                    Text(
                      'Venta',
                      style: themeProvider.theme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: client ? 200 : 150,
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              buttonClient();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Bordes redondeados
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppTheme.colorButton),
                              // Color de fondo del botón
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  client
                                      ? 'Vender a un Cliente'
                                      : 'Venta Rapida',
                                  style:
                                      themeProvider.theme.textTheme.bodySmall,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: themeProvider.theme.primaryColor,
                                  size: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (client)
                          const ContainerInfoSalesScreen(
                            icon: Icons.person_add,
                            text: 'Seleccione \n un cliente',
                          ),
                        const SizedBox(
                          height: 44,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Productos',
                                style: themeProvider.theme.textTheme.bodyMedium
                                    ?.copyWith(color: AppTheme.secondaryColor)),
                            const ContainerInfoSalesScreen(
                              icon: Icons.add_circle,
                              text: 'Añadir Otro',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(), // Esto expandirá el espacio restante
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total',
                          style: themeProvider.theme.textTheme.bodyLarge),
                      Container(
                        width: 150,
                        child: Text('\$0',
                            overflow: TextOverflow.ellipsis,
                            style: themeProvider.theme.textTheme.bodyLarge
                                ?.copyWith(fontSize: 30)),
                      ),
                    ],
                  ),
                  ButtonAppWidget(
                    labelButton: 'Finalizar',
                    fuction: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
