import 'package:flutter/material.dart';
import 'package:task_01/Project1/data/productmodel.dart';

class Cartprovider extends ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(
      productIcon: Icons.phone_android,
      name: 'Smartphone',
      price: 699.99,
    ),
    ProductModel(productIcon: Icons.laptop, name: 'Laptop', price: 1099.99),
    ProductModel(
      productIcon: Icons.headphones,
      name: 'Headphones',
      price: 89.99,
    ),
    ProductModel(productIcon: Icons.watch, name: 'Smartwatch', price: 199.99),
    ProductModel(productIcon: Icons.camera_alt, name: 'Camera', price: 549.99),
    ProductModel(
      productIcon: Icons.speaker,
      name: 'Bluetooth Speaker',
      price: 59.99,
    ),
    ProductModel(productIcon: Icons.tablet, name: 'Tablet', price: 399.99),
    ProductModel(productIcon: Icons.keyboard, name: 'Keyboard', price: 49.99),
    ProductModel(
      productIcon: Icons.mouse,
      name: 'Wireless Mouse',
      price: 29.99,
    ),
    ProductModel(
      productIcon: Icons.gamepad,
      name: 'Game Controller',
      price: 69.99,
    ),
    ProductModel(productIcon: Icons.tv, name: '4K Television', price: 799.99),
    ProductModel(productIcon: Icons.print, name: 'Printer', price: 149.99),
    ProductModel(productIcon: Icons.router, name: 'Wi-Fi Router', price: 79.99),
    ProductModel(productIcon: Icons.mic, name: 'Microphone', price: 119.99),
    ProductModel(
      productIcon: Icons.monitor,
      name: 'Computer Monitor',
      price: 279.99,
    ),
    ProductModel(
      productIcon: Icons.memory,
      name: 'USB Flash Drive',
      price: 19.99,
    ),
    ProductModel(productIcon: Icons.power, name: 'Power Bank', price: 39.99),
    ProductModel(
      productIcon: Icons.lightbulb,
      name: 'Smart Light Bulb',
      price: 24.99,
    ),
    ProductModel(productIcon: Icons.videocam, name: 'Webcam', price: 89.99),
    ProductModel(
      productIcon: Icons.storage,
      name: 'External Hard Drive',
      price: 109.99,
    ),
  ];
  List<ProductModel> cart = [];
  void addCart(ProductModel product) {
    if (!cart.contains(product)) {
      cart.add(product);
    }
    product.quntity++;
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    if (product.quntity == 1) {
      cart.remove(product);
      product.quntity = 0;
    } else {
      product.quntity--;
    }
    notifyListeners();
  }

  double calcTotal() {
    double total = 0;
    for (ProductModel p in cart) {
      total += p.quntity * p.price;
    }
    return total;
  }
}
