import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/domain/models/inventory/products/products.dart';
import 'package:app_barber_yha/infrasctructure/repositories/inventario/products/product_repositorie.dart';
import 'package:app_barber_yha/presentation/screens/admin/sales/providers/providers_sales.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/providers.dart';
import '../../../clients/widgets/search_clients_widgets.dart';
import '../../widgets/container_products_widget.dart';
import 'sale.dart';

class ListProductsScreen extends StatelessWidget {
  const ListProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductRepository repository = ProductRepository();
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providersSales = Provider.of<ProvidersSales>(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyIconAppWidget(
                    fuction: () {
                      providersSales.updateQueryProducts('');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoSalesScreen(),
                        ),
                      );
                    },
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                const SizedBox()
              ],
            ),
            Text(
              'Productos',
              style: themeProvider.theme.textTheme.titleLarge,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SearchClientsWidget(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Seleccionados ${providersSales.productosSeleccionados.length}',
              style: themeProvider.theme.textTheme.bodyMedium,
            ),
            () {
              if (providersSales.productosSeleccionados.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 310,
                    child: FutureBuilder<List<Product>>(
                      future:
                          Future.value(providersSales.productosSeleccionados),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          // final allProducts = snapshot.data!;
                          // providersSales.performShoppingCart(allProducts);
                          return Consumer<ProvidersSales>(
                            builder: (context, providersSales, child) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: providersSales
                                    .productosSeleccionados.length,
                                itemBuilder: (context, index) {
                                  final product = providersSales
                                      .productosSeleccionados[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppTheme.colorButton,
                                          width: 2.0, // Ancho del borde
                                        ),
                                      ),
                                      child: ContainerProductWidget(
                                        onTap: () {
                                          providersSales
                                              .removerProductShoppingCart(
                                                  product);
                                        },
                                        foto: product.foto,
                                        nombre: product.nombre,
                                        precio: product.precio,
                                        unidades: product.unidades,
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
                );
              } else {
                return const SizedBox(
                  height: 0,
                  width: 0,
                );
              }
            }(),
            // if (providersSales.productosSeleccionados == [])

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Otros Productos',
                    style: themeProvider.theme.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 400,
                    child: FutureBuilder(
                      future: repository.getproducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          final allFoodDrinks = snapshot.data!;
                          providersSales.performSearchProducts(allFoodDrinks);
                          return Consumer<ProvidersSales>(
                            builder: (context, providersSales, child) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    providersSales.searchResultsProducts.length,
                                itemBuilder: (context, index) {
                                  final product = providersSales
                                      .searchResultsProducts[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          // color: Color(Colors.amber),
                                          // () {
                                          // }(),
                                          width: 2.0, // Ancho del borde
                                        ),
                                      ),
                                      child: ContainerProductWidget(
                                        onTap: () {
                                          Product productSelect = Product(
                                              category: product.category,
                                              descripcion: product.descripcion,
                                              foto: product.foto,
                                              nombre: product.nombre,
                                              precio: product.precio,
                                              unidades: product.unidades);
                                          providersSales.addProductShoppingCart(
                                              productSelect);
                                        },
                                        foto: product.foto,
                                        nombre: product.nombre,
                                        precio: product.precio,
                                        unidades: product.unidades,
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
                  const SizedBox(height: 10),
                  ButtonAppWidget(
                    labelButton: 'Agregar',
                    fuction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InfoSalesScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
