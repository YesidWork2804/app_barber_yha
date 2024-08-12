import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import '../../../presentation/auth/auth.presentation.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obscureText = true;
// final loginUseCase = locator<LoginUseCase>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final providerApp = Provider.of<ProvidersApp>(context);

    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
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
                          textInputType: TextInputType.number,
                          fuctionValidators: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'El campo es Requerido',
                            ),
                            FormBuilderValidators.numeric(
                              errorText: 'El campo debe ser Numerico',
                            ),
                            FormBuilderValidators.minLength(10,
                                errorText:
                                    'El telefono debe contener minimo 10 numeros')
                          ]),
                          icon: Icons.phone),
                      const SizedBox(height: 16),
                      FormBuilderTextFieldPasswordWidget(
                          phoneController: passwordController,
                          labelText: 'Contraseña',
                          name: 'password',
                          iconLeft: Icons.lock,
                          fuctionValidators: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'El campo es Requerido',
                            ),
                          ]),
                          formKey: formKey),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        providerApp.toggleVisibility();
                      },
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
                  fuction: () async {
                    authAPi
                        .login('123456789', 'ejemplo')
                        .then((value) => print(value));

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const HomeAdminScreen()));
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
