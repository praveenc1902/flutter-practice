import 'package:flutter/material.dart';
import 'package:flutterstatemanage/pages/cart_page.dart';
import 'package:flutterstatemanage/pages/products_page.dart';
import 'package:flutterstatemanage/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter State Management',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
            useMaterial3: true
        ),
        initialRoute: '/products',
        routes: {
          '/products': (context) => ProductsPage(),
          '/cart': (context) => CartPage()
        },
        debugShowCheckedModeBanner: false,
      
      ),
    );
  }
}
