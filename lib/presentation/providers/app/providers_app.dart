import 'package:app_barber_yha/domain/models/admin/admin.dart';
import 'package:flutter/material.dart';

import '../../../infrasctructure/repositories/admin/admin_repository.dart';

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
  Admins? _admin;
  Admins? get admin => _admin;

  void guardarAdmin(Admins nuevoAdmin) {
    _admin = nuevoAdmin;
    notifyListeners();
  }

  // Método para obtener el objeto Admins por teléfono
  Future<Admins?> getAdminByPhone(String telefono) async {
    List<Admins> admins = await AdminRepository().getAdmins();
    return admins.firstWhere(
      (admin) => admin.telefono == telefono,
    );
  }

  // Método para verificar si existe un administrador con el número de teléfono dado
  Future<bool> adminExistsByPhone(String telefono) async {
    List<Admins> admins = await AdminRepository().getAdmins();
    return admins.any((admin) => admin.telefono == telefono);
  }
}
