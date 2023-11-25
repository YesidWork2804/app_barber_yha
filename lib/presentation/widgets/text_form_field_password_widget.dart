import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:app_barber_yha/presentation/providers/app/providers_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class FormBuilderTextFieldPasswordWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final String labelText;
  final IconData? icon;
  final String name;
  final GlobalKey<FormBuilderState> formKey;

  final String? Function(String?)? fuctionValidators;

  const FormBuilderTextFieldPasswordWidget({
    Key? key,
    required this.phoneController,
    required this.labelText,
    this.fuctionValidators,
    this.icon,
    required this.name,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final themeProviderApp = Provider.of<ProvidersApp>(context);
    return FormBuilderTextField(
      name: name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: (value) {
        if (formKey.currentState!.saveAndValidate()) {}
      },
      controller: phoneController,
      style: themeProvider.theme.textTheme.displayLarge,
      decoration: InputDecoration(
          hintText: labelText,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                themeProviderApp.toggleVisibility();
              },
              icon: Icon(
                  themeProviderApp.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 36),
              color: AppTheme.secondaryColor,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Icon(icon, color: AppTheme.secondaryColor, size: 30),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: themeProvider.theme.secondaryHeaderColor),
      keyboardType: TextInputType.visiblePassword,
      validator:
          FormBuilderValidators.required(errorText: 'El campo es requerido'),
      obscureText: themeProviderApp.obscureText,
    );
  }
}
