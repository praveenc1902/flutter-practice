import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/CartPage.dart';
import 'package:shopapp/cart_provider.dart';

import 'global_variable.dart';
class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object>  product;
  const ProductDetailsPage(
      {
        super.key,
        required this.product,
      }
      );


  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int sizesel=0;

  void onTap() {
    if (sizesel != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
          {
            'id': widget.product['id'],
            'title': widget.product['title'],
            'price': widget.product['price'],
            'size': widget.product['size'],
            'imageUrl': widget.product['imageUrl'],
            'company': widget.product['company'],
            'size': sizesel
          }

      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("You got the Fit Mate !!")
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:Text("Buddy, You missed to select your fit !!")
      ));
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   sizesel = (product['sizes'] as List<int>)[0]
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Details")),
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          Spacer(flex: 2,),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    widget.product['price'].toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context,index){
                      final size = (widget.product['sizes'] as List<int>)[index];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                        // sizesel = (product['sizes'] as List<int>)[index]
                        child : GestureDetector(
                        onTap:() {
                          setState(() {
                            sizesel = size;
                          });
                        },
                        child: Chip(label: Text(size.toString()),
                        backgroundColor: sizesel ==size ? Colors.yellow : null,
                        ),
                        )
                      );
                    }
                  ),
                ),
                ElevatedButton(onPressed: onTap,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize: Size(double.infinity, 50)
                    ),

                    child: Text("Add To Cart")
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
