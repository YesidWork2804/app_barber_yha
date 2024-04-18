import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../widgets/widgets.dart';
import 'inventory_widgets.dart';
// import 'list_radio_buttons_widget.dart';

class FoodDrinkFormWidget extends StatelessWidget {
  const FoodDrinkFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController unitPriceController = TextEditingController();
    final TextEditingController unitsController = TextEditingController();
    final TextEditingController descriptionsController =
        TextEditingController();

    return Form(
        child: Column(
      children: [
        FormBuilderTextFieldWidget(
          formKey: formKey,
          labelText: 'Nombre',
          name: 'nombre',
          phoneController: nameController,
          suffixIcon: false,
          icon: Icons.local_drink,
        ),
        const SizedBox(height: 10),
        FormBuilderTextFieldWidget(
          formKey: formKey,
          labelText: 'Precio Unitario',
          name: 'precioUnitario',
          phoneController: unitPriceController,
          suffixIcon: false,
          icon: Icons.monetization_on,
          textInputType: TextInputType.number,
          fuctionValidators: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'El campo es Requerido',
            ),
            FormBuilderValidators.numeric(
              errorText: 'El campo debe ser Numerico',
            ),
          ]),
        ),
        const SizedBox(height: 10),
        const DropDownButtonWidget(),
        FormBuilderTextFieldWidget(
          formKey: formKey,
          labelText: 'Descripcion',
          name: 'descripcion',
          phoneController: descriptionsController,
          suffixIcon: false,
          icon: Icons.sort_by_alpha_sharp,
        ),
        const SizedBox(height: 10),
        FormBuilderTextFieldWidget(
          formKey: formKey,
          labelText: 'Unidades',
          name: 'unidades',
          phoneController: unitsController,
          suffixIcon: false,
          icon: Icons.format_underlined_rounded,
          textInputType: TextInputType.number,
        ),
        const ListRadioButtonsWidget(),
      ],
    ));
  }
}
