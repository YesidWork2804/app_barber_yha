import 'package:flutter/material.dart';

class ProvidersApp extends ChangeNotifier {
  //Validaciones para el TextForm de la Contrasena
  bool _obscureText = true;
  bool get obscureText => _obscureText;

  void toggleVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  //CheckBox global
  bool _checkBoxCheked = false;
  bool get checkBoxCheked => _checkBoxCheked;

  void toggleVisibilityCheckBox() {
    _checkBoxCheked = !_checkBoxCheked;
    notifyListeners();
  }
}
