import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_01/Project1/data/productmodel.dart';
import 'package:task_01/Project1/providers/cartprovider.dart';

class Customcart extends StatelessWidget {
  final ProductModel product;
  const Customcart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var providerObject = context.read<Cartprovider>();
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      color: Colors.white70,
      margin: EdgeInsets.all(20),
      child: ListTile(
        leading: Icon(product.productIcon, color: Colors.teal, size: 35),
        title: Text(product.name, style: TextStyle(fontWeight: .bold)),
        subtitle: Text(
          "price:\$${product.price}",
          style: TextStyle(color: Colors.blueGrey),
        ),
        trailing: Row(
          mainAxisSize: .min,
          spacing: 5,
          children: [
            IconButton(
              onPressed: () => providerObject.removeFromCart(product),
              icon: Icon(Icons.remove),
            ),
            Text("${product.quntity}"),
            IconButton(
              onPressed: () => providerObject.addCart(product),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
