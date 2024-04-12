import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/screens/admin/inventory/widgets/icon_inventory_widget.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoFoodDrinkWidget extends StatelessWidget {
  final String foto;
  final String nombre;
  final String descripcion;

  // final VoidCallback onTap;
  final int precio;
  final int unidades;

  const InfoFoodDrinkWidget({
    super.key,
    required this.foto,
    required this.nombre,
    required this.precio,
    required this.unidades,
    required this.descripcion,
  });

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
              Text('The Barber Club',
                  style: themeProvider.theme.textTheme.titleLarge!),
              Center(
                child: Column(
                  children: [
                    Container(width: 150, child: Image.asset(foto)),
                    const SizedBox(height: 10),
                    Text(nombre,
                        style: themeProvider.theme.textTheme.bodyLarge!
                            .copyWith(fontSize: 30)),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('unidades $unidades',
                            style: themeProvider.theme.textTheme.bodySmall!),
                        Text('\$$precio',
                            style: themeProvider.theme.textTheme.bodySmall!),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: 400,
                          height: 120,
                          child: Text(descripcion,
                              style: themeProvider.theme.textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 140),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconInventoryWidget(
                            text: 'Eliminar',
                            iconData: Icons.delete,
                            fuction: () {}),
                        IconInventoryWidget(
                            text: 'Editar',
                            iconData: Icons.edit,
                            fuction: () {})
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
