import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../infrasctructure/repositories/barbers/barber_repository.dart';
import '../../../../widgets/widgets.dart';
import '../admin_barber.dart';

class AdminBarbersScreen extends StatefulWidget {
  const AdminBarbersScreen({super.key});

  @override
  State<AdminBarbersScreen> createState() => _AdminBarbersScreenState();
}

final BarberRepository repository = BarberRepository();

class _AdminBarbersScreenState extends State<AdminBarbersScreen> {
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
                    Text('Barberos',
                        style: themeProvider.theme.textTheme.titleLarge),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 500,
                        child: FutureBuilder(
                            future: repository.getBarbers(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              // Si hay datos disponibles, muestra el mensaje
                              else if (snapshot.hasData) {
                                final barbers = snapshot.data!;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: barbers.length,
                                  itemBuilder: (context, index) {
                                    final barber = barbers[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: CardBarberWidget(
                                        cantidadTurno: barber.cantidadTurnos,
                                        estado: barber.estaActivo,
                                        nombre: barber.nombre,
                                        telefono: barber.telefono,
                                        foto: barber.foto,
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
                                builder: (context) =>
                                    const AdminFormBarberScreen()));
                      },
                      labelButton: 'Nuevo Barbero',
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
