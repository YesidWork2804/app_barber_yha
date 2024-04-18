import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:app_barber_yha/presentation/screens/admin/widgets/icon_inventory_widget.dart';
import 'package:flutter/material.dart';

void showSearchModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Filtros',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: AppTheme.colorButton,
            ),
            IconAdminWidget(
                text: 'Ordenar por Nombre',
                iconData: Icons.sort_by_alpha,
                fuction: () {}),
            IconAdminWidget(
                text: 'Ordenar por Precio',
                iconData: Icons.attach_money,
                fuction: () {}),
            IconAdminWidget(
                text: 'Bebidas', iconData: Icons.local_drink, fuction: () {}),
            IconAdminWidget(
                text: 'Comidas',
                iconData: Icons.food_bank_sharp,
                fuction: () {}),
          ],
        ),
      );
    },
  );
}
