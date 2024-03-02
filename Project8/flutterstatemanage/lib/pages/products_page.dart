import 'package:flutter/material.dart';
import 'package:flutterstatemanage/consts.dart';
import 'package:flutterstatemanage/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildui(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text("Products"),
      actions: [
        IconButton(onPressed: () {
          Navigator.of(context).pushNamed("/cart");
        }, icon:
        Icon(Icons.shopping_cart))
      ],
    );
  }

  Widget _buildui(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
        Product product = products[index];
        return ListTile(
          leading: Container(
            height: 25,
            width: 25,
            color: product.color,
          ),
          title: Text(
            product.name
          ),
          trailing: Checkbox(
            value: cartProvider.items.contains(product),
            onChanged: (value){
              if(value == true){
                cartProvider.add(product);
              }else{
                cartProvider.remove(product);
              }
            },
          ),
        );
    });
  }
}
