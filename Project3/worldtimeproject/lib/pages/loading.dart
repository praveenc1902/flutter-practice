import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:worldtimeproject/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupworldtime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' :  instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isdaytime' : instance.isDayTime
    });

  }

  @override
  void initState() {
    super.initState();
    print("intistate function ran");
    setupworldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
