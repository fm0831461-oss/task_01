import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/Widget/custom_home.dart';
import 'package:task_01/Project1/providers/cartprovider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartprovidor = context.read<Cartprovider>();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Shopping")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: cartprovidor.products.length,
        itemBuilder: (context, index) =>
            Customhome(product: cartprovidor.products[index]),
      ),
    );
  }
}
