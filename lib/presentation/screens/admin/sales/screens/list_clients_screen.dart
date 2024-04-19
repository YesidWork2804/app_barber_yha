import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:app_barber_yha/domain/models/clients/client.dart';
import 'package:app_barber_yha/infrasctructure/repositories/clients/client_repository.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/providers/providers_sales.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';
import '../../clients/screens/card_client_widget.dart';
import '../widgets/search_clients_widgets.dart';
import 'info_sales_screen.dart';

class ListClientsScreen extends StatelessWidget {
  const ListClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ClientRepository repository = ClientRepository();
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providersSales = Provider.of<ProvidersSales>(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const ButtonTopNavigatorWidget(
              buttonUser: false,
            ),
            Text(
              'Clientes',
              style: themeProvider.theme.textTheme.titleLarge,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SearchClientsWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 500,
                child: FutureBuilder(
                  future: repository.getClients(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final allFoodDrinks = snapshot.data!;
                      providersSales.performSearch(allFoodDrinks);
                      return Consumer<ProvidersSales>(
                        builder: (context, providersSales, child) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: providersSales.searchResults.length,
                            itemBuilder: (context, index) {
                              final client =
                                  providersSales.searchResults[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 18),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: () {
                                        if (providersSales
                                                    .clienteSeleccionado !=
                                                null &&
                                            providersSales.clienteSeleccionado!
                                                    .telefono ==
                                                client.telefono) {
                                          return AppTheme
                                              .colorButton; // Color del borde si la condición se cumple
                                        } else {
                                          return Colors
                                              .transparent; // Color del borde si la condición no se cumple
                                        }
                                      }(),
                                      width: 2.0, // Ancho del borde
                                    ),
                                  ),
                                  child: CardClientWidget(
                                    ontap: () {
                                      Clients clientSelect = Clients(
                                          foto: client.foto,
                                          nombre: client.nombre,
                                          telefono: client.telefono);
                                      providersSales
                                          .seleccionarCliente(clientSelect);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InfoSalesScreen(
                                                    nombre: client.nombre,
                                                    telefono: client.telefono,
                                                    foto: client.foto,
                                                  )));
                                    },
                                    nombre: client.nombre,
                                    telefono: client.telefono,
                                    foto: client.foto,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Text('El Future es null');
                    }
                  },
                ),
              ),
            ),
            if (providersSales.clienteSeleccionado != null)
              ButtonAppWidget(
                labelButton: 'Quitar Cliente',
                fuction: () {
                  providersSales.updateQuery('');
                  providersSales.deseleccionarCliente();
                },
              )
          ],
        ),
      )),
    );
  }
}
