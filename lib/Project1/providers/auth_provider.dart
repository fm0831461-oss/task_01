import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  bool isPassVisible = false;
  void togglePassVisibility() {
    isPassVisible = !isPassVisible;
    notifyListeners();
  }

  String? validEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "PLS enter your email";
    }
    return null;
  }

  String? validPass(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "PLS enter your password";
    }
    return null;
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPass.dispose();
    super.dispose();
  }
}
