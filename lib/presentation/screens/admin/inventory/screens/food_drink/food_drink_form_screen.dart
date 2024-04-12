import 'package:app_barber_yha/presentation/providers/providers.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/form_food_drink_form_widget.dart';

class FoodDrinkFormScreen extends StatefulWidget {
  const FoodDrinkFormScreen({super.key});

  @override
  State<FoodDrinkFormScreen> createState() => _FoodDrinkFormScreenState();
}

class _FoodDrinkFormScreenState extends State<FoodDrinkFormScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    //Lista de Comidas y Bebidas
    final List<String> imageUrls = [
      'assets/img/drinkFood/logo_pepsi.png',
      'assets/img/drinkFood/logo_cola.png',
      'assets/img/drinkFood/logo_agua.png',
      'assets/img/drinkFood/logo_soda.png',
      'assets/img/drinkFood/logo_cerveza.png',
      'assets/img/drinkFood/logo_bebida.png',
      'assets/img/drinkFood/logo_papas.png',
      'assets/img/drinkFood/logo_energy.png',
    ];
    final PageController pageController = PageController(
      viewportFraction: 0.33,
      initialPage: 2,
    );

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('The Barber Club',
                        style: themeProvider.theme.textTheme.titleLarge),
                    // TitleIconWidget(),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 140,
                      width: 400,
                      child: Stack(
                        children: [
                          PageView.builder(
                            onPageChanged: (value) {
                              // print('object');
                            },
                            controller: pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: imageUrls.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  imageUrls[index],
                                  width: 100.0,
                                  height: 100.0,
                                ),
                              );
                            },
                          ),
                          Positioned(
                            top: 7,
                            right: 134,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(color: Colors.red, width: 3)),
                              width: 125,
                              height: 125,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            FoodDrinkFormWidget(),
                            SizedBox(height: 10),
                          ],
                        )),
                    const SizedBox(height: 10),
                    ButtonAppWidget(
                      labelButton: 'Agregar',
                      fuction: () {},
                    )
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
