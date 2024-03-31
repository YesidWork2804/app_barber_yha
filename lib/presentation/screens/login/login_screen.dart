import 'package:app_barber_yha/app/router/routes_app.dart';
import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      bottomNavigationBar: IconButton(
          onPressed: () {
            themeProvider.toggleTheme();
          },
          icon: const Icon(
            Icons.abc,
            size: 50,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleIconWidget(),
                const SizedBox(height: 40),
                FormBuilder(
                  key: formKey, // _formKey es una GlobalKey<FormBuilderState>
                  child: Column(
                    children: [
                      FormBuilderTextFieldWidget(
                          formKey: formKey,
                          labelText: 'Telefono',
                          name: 'telefono',
                          phoneController: phoneController,
                          icon: Icons.phone),
                      const SizedBox(height: 16),
                      FormBuilderTextFieldPasswordWidget(
                          phoneController: passwordController,
                          labelText: 'Contraseña',
                          name: 'password',
                          icon: Icons.lock,
                          formKey: formKey)
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Registrarse',
                        style: themeProvider.theme.textTheme.bodySmall
                            ?.copyWith(color: AppTheme.colorButton),
                      ),
                    ),
                    Row(
                      children: [
                        const MyChechBox(),
                        Text(
                          'Recordar Sesion',
                          style: themeProvider.theme.textTheme.bodySmall,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 147),
                ButtonAppWidget(
                  fuction: () {
                    // if (formKey.currentState!.validate()) {
                    // }
                    goRouter.go('/admin/home');
                  },
                  labelButton: 'Entrar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
