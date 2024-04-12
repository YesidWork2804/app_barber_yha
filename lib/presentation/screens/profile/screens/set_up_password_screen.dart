import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';
import '../../../widgets/widgets.dart';
import '../widgets/text_form_profile_password_widget.dart';

class SetUpPasswordScreen extends StatefulWidget {
  const SetUpPasswordScreen({super.key});

  @override
  State<SetUpPasswordScreen> createState() => _SetUpPasswordScreenState();
}

class _SetUpPasswordScreenState extends State<SetUpPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providerApp = Provider.of<ProvidersApp>(context);
    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    // phoneController.text = providerApp.admin!.telefono;
    // nameController.text = providerApp.admin!.nombre;

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
                  Text('Cambiar Contraseña',
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
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FormBuilder(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormProfilePasswordWidget(
                            labelText: 'Contraseña Antigua',
                            formKey: formKey,
                            name: 'claveAntigua',
                            phoneController: oldPasswordController,
                          ),
                          const SizedBox(height: 10),
                          TextFormProfilePasswordWidget(
                            labelText: 'Contraseña Nueva ',
                            formKey: formKey,
                            name: 'claveNueva',
                            phoneController: newPasswordController,
                          ),
                          const SizedBox(height: 10),
                          TextFormProfilePasswordWidget(
                            labelText: 'Confirmar Contraseña  ',
                            formKey: formKey,
                            name: 'confirmarClave',
                            phoneController: confirmPasswordController,
                          )
                        ],
                      )),
                  const SizedBox(height: 50),
                  ButtonAppWidget(
                    fuction: () {
                      if (newPasswordController.text ==
                          confirmPasswordController.text) {
                        print('claves iguales');
                      }
                    },
                    labelButton: 'Guardar Cambios',
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
