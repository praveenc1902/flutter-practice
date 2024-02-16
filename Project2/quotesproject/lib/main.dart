import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: QuotesList(),
  ));
}
class QuotesList extends StatefulWidget {
  const QuotesList({super.key});

  @override
  State<QuotesList> createState() => _QuotesListState();
}

class _QuotesListState extends State<QuotesList> {

  List<String> quotes = [
    "Work Hard Buddy, You have only 1 Life",
    "Do something in Life man !!",
    "Grow Big in Life"
  ];

  Widget quoteTemplate(quote){
    return Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            quote,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.yellow
            ),
          ),
          SizedBox(height: 6),
          TextButton.icon(onPressed: (){
            setState(() {
              quotes.remove(quote);
            });

          }, icon: Icon(Icons.delete), label: Text("delete me"))
        ],
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Awesome Quotes"),
      ),
      body: Column(
        // children: [
          // Text("Work hard"),
          // Text("YOLO")
          children: quotes.map((quote){
          return quoteTemplate(quote);
            // return Text(quote);
    }).toList(),
        // ],
      ),
    );
  }
}
