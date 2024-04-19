import 'package:app_barber_yha/infrasctructure/repositories/clients/client_repository.dart';
import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';
import '../admin_barber/admin_barber.dart';
import 'screens/admin_client_info_screen.dart';
import 'screens/card_client_widget.dart';

class AdminClientsHomeScreen extends StatefulWidget {
  const AdminClientsHomeScreen({super.key});

  @override
  State<AdminClientsHomeScreen> createState() => _AdminClientsHomeScreenState();
}

final ClientRepository repository = ClientRepository();

class _AdminClientsHomeScreenState extends State<AdminClientsHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const ButtonTopNavigatorWidget(
              buttonUser: false,
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Clientes',
                        style: themeProvider.theme.textTheme.titleLarge),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 500,
                        child: FutureBuilder(
                            future: repository.getClients(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              // Si hay datos disponibles, muestra el mensaje
                              else if (snapshot.hasData) {
                                final clients = snapshot.data!;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: clients.length,
                                  itemBuilder: (context, index) {
                                    final client = clients[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: CardClientWidget(
                                        ontap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminClientInfo(
                                                        nombre: client.nombre,
                                                        foto: client.foto,
                                                        telefono:
                                                            client.telefono,
                                                      )));
                                        },
                                        nombre: client.nombre,
                                        telefono: client.telefono,
                                        foto: client.foto,
                                      ),
                                    );
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
                    ButtonAppWidget(
                      fuction: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminFormScreen()));
                      },
                      labelButton: 'Nuevo Cliente',
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
