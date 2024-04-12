import 'dart:io';

import 'package:app_barber_yha/app/theme/app_theme.dart';
import 'package:app_barber_yha/presentation/widgets/app/button_app_widget.dart';
import 'package:app_barber_yha/presentation/widgets/app/button_top_navigator_widget.dart';
import 'package:app_barber_yha/presentation/widgets/app/form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../providers/providers.dart';

class AdminFormBarberScreen extends StatefulWidget {
  const AdminFormBarberScreen({super.key});

  @override
  State<AdminFormBarberScreen> createState() => _AdminFormBarberScreenState();
}

class _AdminFormBarberScreenState extends State<AdminFormBarberScreen> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController photoController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const ButtonTopNavigatorWidget(
                  buttonUser: false,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeProvider.theme.cardColor),
                  height: 150,
                  width: 150,
                  child: Center(
                    child: _imageFile == null
                        ? const Icon(
                            Icons.camera,
                            size: 70,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormBuilderTextFieldWidget(
                            formKey: _formKey,
                            labelText: 'Nombre',
                            name: 'nombre',
                            phoneController: nameController,
                            icon: Icons.account_circle,
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
                          ),
                          const SizedBox(height: 20),
                          FormBuilderTextFieldWidget(
                            textInputType: TextInputType.phone,
                            formKey: _formKey,
                            labelText: 'Telefono',
                            name: 'telefono',
                            phoneController: phoneController,
                            icon: Icons.phone,
                            fuctionValidators: FormBuilderValidators.numeric(
                              errorText: 'El campo debe ser Numerico',
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 180,
                ),
                ButtonAppWidget(
                  fuction: () {},
                  labelButton: 'Agregar',
                ),
              ],
            ),
            Positioned(
              right: 110,
              top: 190,
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.colorButton,
                    borderRadius: BorderRadius.circular(100)),
                height: 40,
                width: 40,
                child: Center(
                    child: IconButton(
                  icon: Icon(Icons.camera_alt,
                      color: themeProvider.theme.colorScheme.background),
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                )),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
