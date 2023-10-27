import 'package:flutter/material.dart';
import 'package:menumakanan/styles.dart';
import 'home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: pageBgColor,
        appBar: AppBar(
          backgroundColor: headBGColor,
          title: Text(
            "Kuliner Nusantara",
            style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}

