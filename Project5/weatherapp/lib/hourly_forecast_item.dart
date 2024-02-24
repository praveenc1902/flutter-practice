import 'package:flutter/material.dart';

class HourleyForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;
  const HourleyForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temp
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 6,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Text(time,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            maxLines: 1,
            ),
            SizedBox(height:8),
            Icon(icon,
              size: 30,),
            SizedBox(height:8),
            Text(temp)
          ],
        ),
      ),
    );
  }
}


