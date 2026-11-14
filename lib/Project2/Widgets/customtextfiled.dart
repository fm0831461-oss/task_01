import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project2/Providers/auth_providerp2.dart';

class Customtextfiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final bool isPass;
  final IconData prefixIcon;
  const Customtextfiled({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.isPass = false,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final logProvider = context.watch<AuthProviderp2>();
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPass && !logProvider.isPass,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffix: isPass
            ? IconButton(
                onPressed: logProvider.isVisiability,
                icon: Icon(
                  logProvider.isPass ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}
