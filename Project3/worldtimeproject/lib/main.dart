import 'dart:js';

import 'package:flutter/material.dart';
import 'package:worldtimeproject/pages/choose_location.dart';
import 'package:worldtimeproject/pages/home.dart';
import 'package:worldtimeproject/pages/loading.dart';
import 'package:worldtimeproject/pages/choose_location.dart';
// import 'package:worldtimeproject/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) => Choose_Location()
    },
  ));
}
