import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  final List<Map<String,dynamic>> cart = [];

  void addProduct(product){
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(product) {
    cart.remove(product);
    notifyListeners();
  }
}