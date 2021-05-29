import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tbr_mobile/tutorial/tutorial.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    Future.delayed(Duration(seconds: 3)).then(
      (_) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TutorialPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1e3799),
      child: Center(
        child: Container(
          width: 150,
          height: 150,
          child: Image.asset('assets/splash.gif'),
        ),
      ),
    );
  }
}
