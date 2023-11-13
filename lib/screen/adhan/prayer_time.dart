import 'package:flutter/material.dart';

class PrayerTimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String prayerTime = getPrayerTime();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prayer Time App'),
        ),
        body: Center(
          child: Text(
            'Current Prayer Time: $prayerTime',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  String getPrayerTime() {
    DateTime now = DateTime.now();
    TimeOfDay currentTime = TimeOfDay.fromDateTime(now);

    if (currentTime.hour >= 12 && currentTime.hour < 16) {
      return 'Johar';
    } else if (currentTime.hour == 16 && currentTime.minute < 30) {
      return 'Ashr';
    } else if (currentTime.hour == 16 && currentTime.minute >= 30 ||
        (currentTime.hour > 16 && currentTime.hour < 18)) {
      return 'Magrib';
    } else if (currentTime.hour >= 19 && currentTime.hour < 23) {
      return 'Isha';
    } else if (currentTime.hour >= 23 ||
        (currentTime.hour >= 0 && currentTime.hour < 4)) {
      return 'Sabr Qader';
    } else if (currentTime.hour >= 4 && currentTime.hour < 6) {
      return 'Fajr';
    } else {
      return 'Unknown';
    }
  }
}
