import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';

class TextFormProfilePasswordWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final String labelText;
  final String name;
  final GlobalKey<FormBuilderState> formKey;

  final String? Function(String?)? fuctionValidators;

  const TextFormProfilePasswordWidget({
    Key? key,
    required this.phoneController,
    required this.labelText,
    this.fuctionValidators,
    required this.name,
    required this.formKey,
  }) : super(key: key);

  @override
  State<TextFormProfilePasswordWidget> createState() =>
      _FormBuilderTextFieldPasswordWidgetState();
}

class _FormBuilderTextFieldPasswordWidgetState
    extends State<TextFormProfilePasswordWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return StatefulBuilder(builder: (context, setState) {
      return FormBuilderTextField(
          obscureText: obscureText,
          name: widget.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (value) {
            if (widget.formKey.currentState!.saveAndValidate()) {}
          },
          controller: widget.phoneController,
          style: themeProvider.theme.textTheme.bodyMedium!
              .copyWith(fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              labelText: widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelStyle: TextStyle(
                  fontSize: 16, color: themeProvider.theme.primaryColor),
              // labelText: 'Constraseña Antigua',
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                      !obscureText ? Icons.visibility : Icons.visibility_off,
                      size: 30),
                  color: AppTheme.secondaryColor,
                ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: themeProvider.theme.secondaryHeaderColor),
          keyboardType: TextInputType.visiblePassword,
          validator: widget.fuctionValidators
          //     FormBuilderValidators.required(errorText: 'El campo es requerido'),
          // obscureText: themeProviderApp.obscureText,
          );
    });
  }
}
