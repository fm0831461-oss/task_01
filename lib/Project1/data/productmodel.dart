import 'package:flutter/material.dart';

class ProductModel {
  IconData productIcon;
  String name;
  double price;
  int quntity;

  ProductModel({
    required this.productIcon,
    required this.name,
    required this.price,
    this.quntity = 0,
  });
}
