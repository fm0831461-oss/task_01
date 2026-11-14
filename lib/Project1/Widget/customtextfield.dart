import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/providers/auth_provider.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final bool isPass;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.isPass = false,
  });

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<AuthProvider>();
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPass && !logProvider.isPassVisible,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        suffixIcon: isPass
            ? IconButton(
                onPressed: logProvider.togglePassVisibility,
                icon: Icon(
                  logProvider.isPassVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
