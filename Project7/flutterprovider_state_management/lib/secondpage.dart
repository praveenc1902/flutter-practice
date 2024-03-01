import 'package:flutter/material.dart';
import 'package:flutterprovider/homepage.dart';
import 'package:provider/provider.dart';

import 'dataclass.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart",
        ),
        leading: Icon(Icons.shopping_cart),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Row(
                children : [
                  Consumer<DataClass>(builder:(context,data,child){
                    return Text('${data.x}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),);
                  }),
                  SizedBox(width: 300,),
                  Text('Total',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ],
              ),

            )
            ,
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  ElevatedButton(onPressed: () {
                    context.read<DataClass>().decrementX();
                  },
                    child: Text("-"),
                  ),
                  SizedBox(width: 100,),
                  TextButton.icon(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                  }, label: Text("Previous Page",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),


                  ), icon: Icon(Icons.arrow_back),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
