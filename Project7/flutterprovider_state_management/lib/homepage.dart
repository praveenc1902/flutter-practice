import 'package:flutter/material.dart';
import 'package:flutterprovider/secondpage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'dataclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Consumer<DataClass>(builder :(context,data,child){
      return Text('${data.x}',
      style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
      );
      }
      ),
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
                    context.read<DataClass>().incrementX();
                  },
                      child: Text("+"),
                  ),
                    SizedBox(width: 200,),
                    TextButton.icon(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
                  }, label: Text("Next Page",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),


                  ), icon: Icon(Icons.forward),
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
