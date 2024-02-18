import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time = '';
  String flag;
  String url;
  bool isDayTime;

  WorldTime({required this.location,required this.flag,required this.url, required this.isDayTime});

  Future<void> getData() async {
    try {
      Response response = await http.get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(data);

      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));
      isDayTime= now.hour > 6 && now.hour < 20 ? true :false;

      time = now.toString();
      time = DateFormat.jm().format(now);
      print(time);
    }
    catch(e) {
      print("caught error $e");
      time = 'could you pls get time data';
    }
  }


  }

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
