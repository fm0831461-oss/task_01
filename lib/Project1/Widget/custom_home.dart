import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/data/productmodel.dart';
import 'package:task_01/Project1/providers/cartprovider.dart';

class Customhome extends StatelessWidget {
  final ProductModel product;
  const Customhome({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Icon(product.productIcon),
          Text(product.name),
          Text("\$${product.price}"),
          Consumer<Cartprovider>(
            builder: (context, value, child) {
              final isPass = value.cart.contains(product);
              return ElevatedButton(
                onPressed: () => isPass ? null : value.addCart(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPass ? Colors.red : Colors.teal,
                ),
                child: isPass ? Text("Added") : Text("AddToCart"),
              );
            },
          ),
        ],
      ),
    );
  }
}
