import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/screen/adhan/prayer_time.dart';
import 'package:webapp/screen/splash%20screen.dart';

import 'model/clock_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClockModel(),
      child: MaterialApp(
        title: 'Reading App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
