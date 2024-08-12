import 'package:app_barber_yha/app/theme/theme.dart';
import 'package:flutter/material.dart';

class ListRadioButtonsWidget extends StatefulWidget {
  const ListRadioButtonsWidget({super.key});

  @override
  State<ListRadioButtonsWidget> createState() => _ListRadioButtonsWidgetState();
}

String selectedOption = '';

class _ListRadioButtonsWidgetState extends State<ListRadioButtonsWidget> {
  final List<Map<String, dynamic>> items = [
    {'value': 'option 1', 'unidades': 10},
    {'value': 'option 2', 'unidades': 20},
    {'value': 'option 4', 'unidades': 40},
    {'value': 'option 5', 'unidades': 50},
  ];
  @override
  Widget build(BuildContext context) {
    void handleRadioValueChange(String? value) {
      setState(() {
        selectedOption = value!;
      });
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                Text('${items[index]['unidades']}'),
                Radio(
                  value: '${items[index]['value']}',
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    handleRadioValueChange(value);
                    // print('${items[index]['unidades']}');
                  },
                  activeColor: AppTheme.colorButton,
                  visualDensity:
                      const VisualDensity(horizontal: 0.0, vertical: -4.0),
                  // visualDensity: VisualDensity.compact,
                ),
              ],
            );
          }),
    );
  }
}
