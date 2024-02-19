import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    int result = 0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dollar to INR Converter"),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('0',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Please enter the amount in USD',
                    hintStyle: TextStyle(
                        color : Colors.white60
                    ),
                    prefixIcon: Icon(Icons.monetization_on),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(60)
                      )
                    )
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true
                  ),
                ),
                // TextButton
              ),
            ),
            TextButton(onPressed: (){

            },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                foregroundColor: MaterialStatePropertyAll(Colors.black),
                fixedSize: MaterialStatePropertyAll(Size(100,30))
              ),child: Text("Convert"),

            )
          ],
        )
        ),
      )
    );
  }
}
