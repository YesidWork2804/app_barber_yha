import 'package:app_barber_yha/domain/models/admin/admin.dart';
import 'package:flutter/material.dart';

import '../../../infrasctructure/admin/admin_repository.dart';

class ProvidersApp extends ChangeNotifier {
  //Validaciones para el TextForm de la Contrasena
  bool _obscureText = false;
  bool get obscureText => _obscureText;

  void toggleVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  bool _obscureTextt = true;

  bool get obscureTex => _obscureTextt;

  void toggle() {
    _obscureTextt = !_obscureTextt;
    notifyListeners();
  }

  //CheckBox global
  bool _checkBoxCheked = false;
  bool get checkBoxCheked => _checkBoxCheked;

  void toggleVisibilityCheckBox() {
    _checkBoxCheked = !_checkBoxCheked;
    notifyListeners();
  }

//Usuario Logeado
}
