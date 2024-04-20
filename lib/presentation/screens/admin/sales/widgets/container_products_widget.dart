import 'package:app_barber_yha/presentation/widgets/app/my_icon_app_widget.dart';
import 'package:app_barber_yha/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme/app_theme_provider.dart';

class ContainerProductWidget extends StatelessWidget {
  final String foto;
  final String nombre;
  final String descripcion;

  final VoidCallback onTap;
  final double height;
  final int precio;
  final int unidades;
  final bool shoppingCart;

  const ContainerProductWidget({
    super.key,
    // required this.onTap,
    this.height = 80,
    required this.foto,
    required this.nombre,
    required this.precio,
    required this.unidades,
    this.descripcion = '',
    required this.onTap,
    this.shoppingCart = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return GestureDetector(
      onTap: onTap
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => InfoFoodDrinkWidget(
      //               foto: foto,
      //               nombre: nombre,
      //               precio: precio,
      //               unidades: unidades,
      //               descripcion: descripcion,
      //             )));
      ,
      child: Container(
        width: 320,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: themeProvider.theme.cardColor),
        child: Row(
          children: [
            Image.asset(
              foto,
              width: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: themeProvider.theme.textTheme.bodyMedium,
                ),
                Text(
                  '$unidades Unidades Disponibles',
                  style: themeProvider.theme.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),

                // IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                if (shoppingCart)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconAppWidget(
                          icon: Icons.remove, fuction: () {}, size: 20),
                      Text('$unidades'),
                      MyIconAppWidget(
                          icon: Icons.add, fuction: () {}, size: 20),
                    ],
                  ),
                const Expanded(child: SizedBox()),

                Padding(
                  padding: const EdgeInsets.only(left: 170, bottom: 10),
                  child: Text(
                    '\$$precio',
                    style: themeProvider.theme.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
