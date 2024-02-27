import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/cart_provider.dart';
import 'package:shopapp/global_variable.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
       title: Text('your shoe cart',
       style: TextStyle(
           fontSize: 32,
         fontWeight: FontWeight.bold
       ),),
      ),
      body:ListView.builder(
        itemCount: cart.length,
          itemBuilder: (context,index){

          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
              radius: 30,
            ),
            trailing: IconButton(
              onPressed: (){
                showDialog(context: context,
                    builder: (context){
                  return AlertDialog(
                    title: Text("Buddy, Wanna delete your best select?",
                    style: Theme.of(context).textTheme.titleLarge,),
                    content: Text("Think of removing those after imaging yourself with that shoes ?"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child:Text("Will keep them. I feel, They look good on me",
                      style: TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold),
                      )
                      ),
                      TextButton(onPressed: (){
                        Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                        Navigator.of(context).pop();
                      },
                          child: Text("Will  buy next time",
                      style: TextStyle(color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                      )
                      )
                    ],
                  );
                }
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
            ),
            title: Text(
              cartItem['title'].toString(),
                  style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              "size : ${cartItem['size'].toString()}"
            ),
          );
          }
      ),
    );
  }
}
