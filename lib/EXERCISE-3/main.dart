import 'package:assignmentweek8/EXERCISE-3/ui/screens/temperature_screen.dart';
import 'package:flutter/material.dart';

import 'ui/screens/welcome_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isClicked = false;

  void handleClick() {
    setState(() {
      isClicked = !isClicked;
    });
  }
  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isClicked ? TemperatureScreen() : WelcomeScreen(onStartPressed: handleClick,) ,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
