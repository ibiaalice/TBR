import 'package:flutter/material.dart';
import 'package:tbr_mobile/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TBR',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
