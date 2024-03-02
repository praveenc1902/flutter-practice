import 'package:flutter/material.dart';


class Product {
  final int id;
  final String name;
  final double price;
  final Color color;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
  });
}

final List<Product> products = [
  Product(id: 0, name: 'Laptop', price: 99.99, color: Colors.black),
  Product(id: 1, name: 'Desktop', price: 98.99, color: Colors.black12),
  Product(id: 2, name: 'SmartPhone', price: 55.99, color: Colors.deepOrange),
  Product(id: 3, name: 'CPU', price: 19.99, color: Colors.white),
  Product(id: 4, name: 'Keyboard', price: 9.99, color: Colors.black87),
];
