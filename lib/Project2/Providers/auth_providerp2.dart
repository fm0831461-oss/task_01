import 'package:flutter/material.dart';

class AuthProviderp2 extends ChangeNotifier {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isPass;
  AuthProviderp2({this.isPass = false});
  void isVisiability() {
    isPass = !isPass;
    notifyListeners();
  }

  String? emailValid(String? value) {
    if (value == null || value.isEmpty) {
      return "PLS enter your email";
    }
    return null;
  }

  String? passValid(String? value) {
    if (value == null || value.isEmpty) {
      return "PLS enter your password";
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
