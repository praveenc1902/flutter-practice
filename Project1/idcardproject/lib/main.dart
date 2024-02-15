import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: IDCard(),
  ));
}
class IDCard extends StatelessWidget {
  const IDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Praveen ID Card"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
            child:CircleAvatar(
              backgroundImage: AssetImage('assets/praveen.jpeg'),
              radius: 40.0,
            ),
            ),
            SizedBox(height: 10.0,),
            Text("Name",
            style: TextStyle(
              color: Colors.pink,
              letterSpacing: 2.0
            )),
            SizedBox(height:10.0),
            Text("Praveen Reddy C",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20.0),
            Text("Designation",
                style: TextStyle(
                    color: Colors.pink,
                    letterSpacing: 2.0
                )),
            SizedBox(height:10.0),
            Text("Senior Soft. Engineer",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.email
                ),
                SizedBox(width: 10.0),
                Text("praveen.c@company.com",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w200
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}



