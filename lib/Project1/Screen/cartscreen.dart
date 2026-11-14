import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/Widget/customcart.dart';
import 'package:task_01/Project1/providers/cartprovider.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 30, fontStyle: .italic),
        title: Text("My Cart 🛒"),
      ),
      body: Consumer<Cartprovider>(
        builder: (context, value, child) => ListView.builder(
          itemBuilder: (context, index) =>
              Customcart(product: value.cart[index]),
          itemCount: value.cart.length,
        ),
      ),
      bottomNavigationBar: Consumer<Cartprovider>(
        builder: (context, value, child) => BottomAppBar(
          color: Colors.teal,

          child: Text(
            "Total: \$${value.calcTotal().toStringAsFixed(0)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: .bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
