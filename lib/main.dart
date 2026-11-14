import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_01/Project1/providers/auth_provider.dart';
import 'package:task_01/Project1/providers/cartprovider.dart';
import 'package:task_01/Project2/Providers/auth_providerp2.dart';
import 'package:task_01/Project2/Screens/loginscreenp2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => AuthProviderp2()),
        ChangeNotifierProvider(create: (context) => Cartprovider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        // home: Homescreen(),
        home: Loginscreenp2(),
      ),
    );
  }
}
