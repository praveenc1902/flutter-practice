import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/cart_provider.dart';
import 'package:shopapp/home_page.dart';
import 'package:shopapp/product_detail.dart';

import 'global_variable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartProvider()),
        ],
      child: MaterialApp(
        title: "Shoes Shopping App",
        theme: ThemeData(
          fontFamily: 'pra',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          appBarTheme:  AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.redAccent
            )
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 15,
                fontWeight: FontWeight.bold,
            ),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14
            )
          )
        ),
        home: HomePage()//ProductDetailsPage(product: products[0],),
      ),
    );
  }
}
