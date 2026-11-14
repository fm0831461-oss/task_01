import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project2/Providers/auth_providerp2.dart';
import 'package:task_01/Project2/Screens/signupp2.dart';
import 'package:task_01/Project2/Widgets/custombuttom.dart';
import 'package:task_01/Project2/Widgets/customtextfiled.dart';

class Loginscreenp2 extends StatefulWidget {
  const new({super.key});

  @override
  State<Loginscreenp2> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreenp2> {
  final ckey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
                Image.asset(
                  'lib/Assets/login.PNG',
                  height: 200,
                  width: 300,
                  fit: BoxFit.contain,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 50, fontWeight: .bold),
                ),
                SizedBox(height: 5),

                Text(
                  "Enter your data to login",
                  style: TextStyle(fontSize: 10),
                ),
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
                  controller: logProvider.passController,
                  validator: logProvider.passValid,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isPass: true,
                ),
                SizedBox(height: 20),
                Custombuttom(
                  text: "Login",
                  onPressed: () {
                    if (ckey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("done")));
                    }
                  },
                ),
                SizedBox(height: 5),

                Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 160, 20, 151),
                  ),
                ),
                SizedBox(height: 5),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signupp2()),
                    );
                  },
                  child: Text("Dont have an aaccount?   SignUp"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
