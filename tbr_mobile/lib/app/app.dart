import 'package:flutter/material.dart';
import 'package:tbr_mobile/app/splash/splash_screen.dart';

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
