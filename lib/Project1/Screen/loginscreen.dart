import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/Screen/signscreen.dart';
import 'package:task_01/Project1/Widget/custombutton.dart';
import 'package:task_01/Project1/Widget/customtextfield.dart';
import 'package:task_01/Project1/providers/auth_provider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => LoginscreenState();
}

class LoginscreenState extends State<Loginscreen> {
  final ckey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final logProvider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: ckey,
          child: Column(
            children: [
              CustomTextField(
                controller: logProvider.controllerEmail,
                validator: logProvider.validEmail,
                hintText: "Enter your email",
              ),
              const SizedBox(height: 20),

              CustomTextField(
                controller: logProvider.controllerPass,
                validator: logProvider.validPass,
                isPass: true,
                hintText: "Enter your password",
              ),
              const SizedBox(height: 30),

              CustomButton(
                text: "Login",
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
                    MaterialPageRoute(builder: (context) => Signscreen()),
                  );
                },
                child: Text("Ihave Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
