import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class FormBuilderTextFieldWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final String labelText;
  final String name;
  final GlobalKey<FormBuilderState> formKey;
  final IconData? icon;
  final String? Function(String?)? fuctionValidators;

  const FormBuilderTextFieldWidget({
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
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Icon(icon, color: AppTheme.secondaryColor, size: 30),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: themeProvider.theme.secondaryHeaderColor),
      keyboardType: TextInputType.phone,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: 'El campo es Requerido',
        ),
        FormBuilderValidators.numeric(
          errorText: 'El campo debe ser Numerico',
        ),
        FormBuilderValidators.minLength(
          10,
          errorText: 'El telefono debe contener minimo 10 numeros',
        ),
      ]),
    );
  }
}
