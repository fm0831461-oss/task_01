import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project2/Providers/auth_providerp2.dart';
import 'package:task_01/Project2/Screens/loginscreenp2.dart';
import 'package:task_01/Project2/Widgets/custombuttom.dart';
import 'package:task_01/Project2/Widgets/customtextfiled.dart';

class Signupp2 extends StatefulWidget {
  const Signupp2({super.key});

  @override
  State<Signupp2> createState() => _Signupp2State();
}

class _Signupp2State extends State<Signupp2> {
  final ckey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final logProvider = context.read<AuthProviderp2>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Form(
            key: ckey,
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 50, fontWeight: .bold),
                ),
                SizedBox(height: 5),

                Text("Create your Account", style: TextStyle(fontSize: 15)),
                SizedBox(height: 20),

                Customtextfiled(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "PLS enter your UserName";
                    }
                    return null;
                  },
                  hintText: "UserName",
                  prefixIcon: Icons.person,
                ),
                SizedBox(height: 20),
                Customtextfiled(
                  controller: logProvider.emailController,
                  validator: logProvider.passValid,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                ),
                SizedBox(height: 20),
                Customtextfiled(
                  controller: logProvider.passController,
                  validator: logProvider.passValid,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isPass: true,
                ),
                SizedBox(height: 20),
                Customtextfiled(
                  controller: confirmController,

                  hintText: "ConfirmPassword",
                  prefixIcon: Icons.lock,
                  isPass: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "PLS enater Data";
                    }
                    if (value != logProvider.passController.text) {
                      return "Confirm Password not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Custombuttom(
                  text: "Sign Up",
                  onPressed: () {
                    if (ckey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("done")));
                    }
                  },
                ),
                SizedBox(height: 5),

                Text(
                  "Or",
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 160, 20, 151),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SignIn With Google"),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginscreenp2()),
                    );
                  },
                  child: Text(" Already an aaccount Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
