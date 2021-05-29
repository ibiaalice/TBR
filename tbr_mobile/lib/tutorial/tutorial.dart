import 'package:flutter/material.dart';
import 'package:tbr_mobile/home/home_page.dart';
import 'package:tbr_mobile/tutorial/widgets/continue_button.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())),
        label: ContinueButton(),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
