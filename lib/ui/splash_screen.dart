import 'dart:async';

import 'package:bmi/ui/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    print('chceh');
    print('chceh');
    print('chceh');
    print('chceh');
    print('chceh');
    return Scaffold(
      body: Column(
        children: [
          LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color(0xFFEA3799),
            size: 200,
          )
        ],
      ),
    );
  }
}
