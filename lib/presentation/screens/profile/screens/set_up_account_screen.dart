import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../widgets/widgets.dart';

class SetUpAccountScreen extends StatelessWidget {
  const SetUpAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providerApp = Provider.of<ProvidersApp>(context);
    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    final TextEditingController phoneController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    phoneController.text = providerApp.admin!.telefono;
    nameController.text = providerApp.admin!.nombre;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ButtonTopNavigatorWidget(
                    buttonUser: false,
                  ),
                  Text('Configurar Cuenta',
                      style: themeProvider.theme.textTheme.titleLarge
                          ?.copyWith(fontSize: 40)),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                providerApp.admin!.foto,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  FormBuilderTextFieldWidget(
                    phoneController: nameController,
                    labelText: 'Nombre',
                    name: providerApp.admin!.nombre,
                    formKey: formKey,
                    icon: Icons.account_circle,
                    suffixIcon: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextFieldWidget(
                    formKey: formKey,
                    phoneController: phoneController,
                    labelText: 'Nombre',
                    name: providerApp.admin!.telefono,
                    icon: Icons.phone,
                    suffixIcon: true,
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
