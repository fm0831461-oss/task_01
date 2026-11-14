import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/Screen/loginscreen.dart';
import 'package:task_01/Project1/Widget/custombutton.dart';
import 'package:task_01/Project1/Widget/customtextfield.dart';
import 'package:task_01/Project1/providers/auth_provider.dart';

class Signscreen extends StatefulWidget {
  const Signscreen({super.key});

  @override
  State<Signscreen> createState() => _SignscreenState();
}

class _SignscreenState extends State<Signscreen> {
  final ckey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logProvider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Sign Up")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: ckey,
          child: Column(
            children: [
              Text(
                "Create Account",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              CustomTextField(
                controller: nameController,
                hintText: 'Enter your name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              CustomTextField(
                controller: logProvider.controllerEmail,
                hintText: "Enter your email",
                validator: logProvider.validEmail,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: logProvider.controllerPass,
                hintText: "Enter your Password",
                isPass: true,
                validator: logProvider.validPass,
              ),
              CustomTextField(
                controller: confirmPassController,
                hintText: 'Confirm your password',
                isPass: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }

                  if (value != logProvider.controllerPass.text) {
                    return 'Passwords do not match';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  if (ckey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Done")));
                  }
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginscreen()),
                  );
                },
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
