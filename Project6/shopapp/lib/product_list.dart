import 'package:flutter/material.dart';
import 'package:shopapp/product_cart.dart';
import 'package:shopapp/product_detail.dart';

import 'global_variable.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late String selectedcomp;
  final List<String> company = ['All', 'Adidas', 'Nike', 'Bata'];

  @override
  void initState() {
    super.initState();
    selectedcomp = company[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Shoe \nCollection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Shoes",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(40),
                    right: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: company.length,
              itemBuilder: (context, index) {
                final comp_fil = company[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedcomp = comp_fil;
                      });
                    },
                    child: Chip(
                      backgroundColor:
                      selectedcomp == comp_fil ? Colors.amber : Colors.white60,
                      label: Text(comp_fil),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return ProductDetailsPage(product:product);
                        },
                        )
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as String,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven ? Colors.blueAccent:Colors.white60,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
