import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/clock_model.dart';

class ClockScreen extends StatefulWidget {
  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock App'),
      ),
      body: Center(
        child: Consumer<ClockModel>(
          builder: (context, clockModel, child) {
            return Text(
              clockModel.currentTime,
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
    );
  }
}
