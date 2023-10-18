import 'package:flutter/material.dart';
import 'package:webapp/screen/book_screen/book_screen.dart';
import 'package:webapp/screen/home/widget/rounded_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButton(
              text: "Start Reading",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookPage(),
                    ));
              }),
          RoundedButton(text: "Resume Reading", onTap: () {}),
          RoundedButton(text: "Find Page", onTap: () {}),
          RoundedButton(text: "Share", onTap: () {}),
          RoundedButton(text: "Thank You", onTap: () {}),
        ],
      ),
    );
  }
}
