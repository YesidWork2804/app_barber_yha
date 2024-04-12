import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../widgets/widgets.dart';
import '../widgets/container_profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providerApp = Provider.of<ProvidersApp>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ButtonTopNavigatorWidget(
                    buttonUser: false,
                  ),
                  Text('Perfil',
                      style: themeProvider.theme.textTheme.titleLarge
                          ?.copyWith(fontSize: 40)),
                  const ButtonThemeAppWidget()
                ],
              ),
            ),
            SizedBox(
              height: 130,
              width: 130,
              child: Image.asset(
                providerApp.admin!.foto,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              providerApp.admin!.nombre,
              style: themeProvider.theme.textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            const ContainerProfileWidget(),
          ],
        )),
      ),
    );
  }
}
