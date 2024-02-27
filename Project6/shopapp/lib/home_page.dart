import 'package:flutter/material.dart';
import 'package:shopapp/CartPage.dart';
import 'package:shopapp/global_variable.dart';
import 'package:shopapp/product_cart.dart';
import 'package:shopapp/product_detail.dart';
import 'package:shopapp/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;

  List<Widget> pages = [ProductList(),CartPage()];

  // @override
  // void initState() {
  //   super.initState();
  //   selectedcomp = company[0];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: currentPage == 0 ? ProductList() : CartPage(),
        body: IndexedStack(
          index: currentPage,
          children: pages,
          ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
        onTap: (value){
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: ''
        ),
        BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
          label: ''
          ),
      ],
      ),
    );
  }
}
