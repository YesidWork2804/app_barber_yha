import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/screens/admin/clients/screens/card_client_widget.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/providers/providers_sales.dart';
import 'package:app_barber_yha/presentation/widgets/app/show_modal_app.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/providers.dart';
import '../../../inventory/widgets/inventory_widgets.dart';
import '../../widgets/container_info_sales_widget.dart';
import '../../widgets/container_products_widget.dart';
import '../../sales_home_screen.dart';
import 'sale.dart';

class InfoSalesScreen extends StatefulWidget {
  final String foto;
  final String telefono;
  final String nombre;

  const InfoSalesScreen(
      {super.key, this.foto = '', this.telefono = '', this.nombre = ''});

  @override
  State<InfoSalesScreen> createState() => _InfoSalesScreenState();
}

bool client = true;

class _InfoSalesScreenState extends State<InfoSalesScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providersSales = Provider.of<ProvidersSales>(context);

    void buttonClient() {
      setState(() {
        client = !client;
      });
    }

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0, top: 8, left: 8),
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
                  SizedBox(
                    width: 340,
                    child: Column(
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
                                  () {
                                    if (client) {
                                      return 'Vender a un Cliente';
                                    } else {
                                      return 'Venta Rapida';
                                    }
                                  }(),
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
                        const SizedBox(height: 10),
                        if (providersSales.clienteSeleccionado != null)
                          Text('Cliente',
                              style: themeProvider.theme.textTheme.bodyMedium
                                  ?.copyWith(color: AppTheme.secondaryColor)),
                        if (client)
                          if (providersSales.clienteSeleccionado == null)
                            ContainerInfoSalesWidget(
                              ontap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ListClientsScreen()));
                              },
                              icon: Icons.person_add,
                              text: 'Seleccione \n un cliente',
                            ),
                      ],
                    ),
                  ),
                  if (client)
                    if (providersSales.clienteSeleccionado != null)
                      CardClientWidget(
                          nombre: providersSales.clienteSeleccionado!.nombre,
                          telefono:
                              providersSales.clienteSeleccionado!.telefono,
                          foto: providersSales.clienteSeleccionado!.foto,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListClientsScreen()));
                          }),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Productos',
                            style: themeProvider.theme.textTheme.bodyMedium
                                ?.copyWith(color: AppTheme.secondaryColor)),
                        SizedBox(
                          width: 400,
                          height: () {
                            if (client) {
                              return 310.0;
                            } else {
                              return 420.0;
                            }
                          }(),
                          child: ListView(
                            children: [
                              ...providersSales.productosSeleccionados
                                  .map((product) => Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ContainerProductWidget(
                                            shoppingCart: true,
                                            onTap: () {
                                              // providersSales
                                              //     .removerProductShoppingCart(
                                              //         product);
                                            },
                                            foto: product.foto,
                                            nombre: product.nombre,
                                            precio: product.precio,
                                            unidades: product.unidades,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              const SizedBox(
                                height: 10,
                              ),
                              ContainerInfoSalesWidget(
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ListProductsScreen()));
                                },
                                icon: Icons.add_circle,
                                text: 'Añadir Otro',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
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
                    SizedBox(
                      width: 150,
                      child: Text('\$${providersSales.calcularTotalCarrito()}',
                          overflow: TextOverflow.ellipsis,
                          style: themeProvider.theme.textTheme.bodyLarge
                              ?.copyWith(fontSize: 30)),
                    ),
                  ],
                ),
                ButtonAppWidget(
                  labelButton: 'Finalizar',
                  fuction: () {
                    // if (providersSales.productosSeleccionados.isEmpty) {
                    //   ShowModalApp(
                    //       context: context,
                    //       message: 'Debe Registrar algun Producto',
                    //       type: MessageType.info);
                    // } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SalesFinishScreen()));
                    // }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
