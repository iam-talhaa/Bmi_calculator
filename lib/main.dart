import 'package:bmi/ui/homeScreen.dart';
import 'package:bmi/ui/person_list.dart';
import 'package:bmi/ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonList(),
    );
  }
}
