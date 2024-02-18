import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worldtimeproject/services/world_time.dart';
class Choose_Location extends StatefulWidget {
  const Choose_Location({super.key});

  @override
  State<Choose_Location> createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{

    WorldTime instance = locations[index];
    instance.getData();
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
    print({
      'location' : instance.location,
      'flag' : instance.flag,
      'time':instance.time,
      'isdaytime' : instance.isDayTime
    });
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time':instance.time,
      'isdaytime' : instance.isDayTime
    });

  }

  int counter = 0;

 @override
  Widget build(BuildContext context) {
    print("intistate function ran inside widget");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Choose the Location Buddy !!"),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: locations.length
          ,itemBuilder: (context,index){
        return Card(
          child: ListTile(
            onTap: () {
              updateTime(index);
              print("pressed the location");
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        );
          })
    );
  }
}
