import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context){
    return AppBar(
      title: Text("Cart Details"),
    );
  }

  Widget _buildUI(BuildContext context){
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.80,
            child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context,index){
                  Product product = provider.items[index];
                  return ListTile(
                    title: Text(product.name),
                    onLongPress: (){
                      provider.remove(product);
                    },
                  );


            }),
          ),
          Text("Cart Total : ${provider.getCartTotal()}")
        ],
      );
    },

    );
  }
}
