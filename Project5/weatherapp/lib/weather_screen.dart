import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/additional_widget_item.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/secrets.dart';
import 'hourly_forecast_item.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late double temp;

  @override
  void initState() {
    print("~~~~~~~~~~~~~~init state");
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String,dynamic>> getCurrentWeather() async {
    print("~~~~~~~~~~~~~~function called");
    try {
      String cityName = 'London';
      final res = await http.get
        (Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openweatherApiKey"));
      // print(res.body);
      final data = jsonDecode(res.body);
      // setState(() {
      //   temp = data['list'][0]['main']['temp'];
      //   sky = data['list'][0]['main']['temp'];
      // });
      // print("temp is $temp");
      // print("temp is :: -- >");
      // temp = data['list'][0]['main']['temp'];
      // print(temp);
      // print(" skly is :: --> ");
      // print(data['list'][0]['weather']['main']);
      if (data['cod'] != '200') {
        throw 'An unexpected error occured !!';
      }
      return data;
    }
    catch(e) {
      throw e.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    print("~~~~~~~~~~~~~~widget called state");
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
              setState(() {

              });
          }, icon: Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context , snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      print("inside if");
    return Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError){
      return Text(snapshot.error.toString());
    }

    final data = snapshot.data!;
    temp = data['list'][0]['main']['temp'];
    String sky = data['list'][0]['weather'][0]['main'];
    String pressure = data['list'][0]['main']['pressure'].toString();
    String windspeed = data['list'][0]['wind']['speed'].toString();
    String humidity = data['list'][0]['main']['humidity'].toString();
    return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
    children: [
    //main card
    Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
    width: double.infinity,
    child: Card(
    elevation: 15,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10)),
    child: Column(
    children: [
    Text("$temp K",
    style: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold
    ),),
    SizedBox(height: 10,),
    Icon(
      sky =='Clouds' || sky == 'Rain' ? Icons.cloud : Icons.sunny,
    size: 40,),
    SizedBox(height: 8,),
    Text("$sky",
    style: TextStyle(
    fontSize: 15
    ),
    ),
    SizedBox(height: 10,)
    ],
    ),
    ),
    ),
    ),
    SizedBox(height: 20,),
    Align(
    alignment: Alignment.topLeft,
    child: Text("Weather Forecast",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    SizedBox(height: 10,),
    // SingleChildScrollView(
    // scrollDirection: Axis.horizontal,
    // child: Row(
    // children: [
    // // SizedBox( width : 100,
    //   for(int i =0;i < 5 ; i++)
    // HourleyForecast(
    // time: data['list'][i+1]['dt'].toString(), icon: data['list'][i+1]['weather'][0]['main'] == 'Rain' ?Icons.cloud : Icons.sunny, temp: data['list'][i+1]['main']['temp'].toString(),),
    //
    // // ),
    // ],
    // ),
    // ),
    SizedBox(
      height: 120,
      child: ListView.builder(

          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            final hourlyforecast = data['list'][index+1];
            final hourlysky = data['list'][index+1]['weather'][0]['main'];
            final time = DateTime.parse(hourlyforecast['dt_txt'].toString());
            return HourleyForecast(
                time: DateFormat.j().format(time).toString(), // hourlyforecast['dt_txt'].toString(),
              icon: hourlysky == 'Rain' || hourlysky == 'Clouds' ?Icons.cloud : Icons.sunny,
              temp: hourlyforecast['main']['temp'].toString(),);
          }
      ),
    ),
    SizedBox(height: 15,),
    Align(
    alignment: Alignment.topLeft,
    child: Text("Additional Information",
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    AdditionalWidgetItem(
    icon: Icons.water_drop, label: "Humidity", value: humidity),
    AdditionalWidgetItem(
    icon: Icons.air, label: "Wind Speed", value: windspeed),
    AdditionalWidgetItem(icon: Icons.beach_access,
    label: "Pressure",
    value: pressure.toString())
    ],
    ),

    // Placeholder(fallbackHeight: 200,),
    // SizedBox(height: 20,),
    // Placeholder(fallbackHeight: 150,)

    ],
    ),
    );
    }
        // }
        ),
    );
  }
}