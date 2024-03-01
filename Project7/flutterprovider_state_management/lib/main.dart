import 'package:flutter/material.dart';
import 'package:flutterprovider/homepage.dart';
import 'package:flutterprovider/secondpage.dart';
import 'package:provider/provider.dart';

import 'dataclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>DataClass(),
    child:MaterialApp(
      title: 'Cart Correction',
      home: HomePage(),
    ),);
  }
}
