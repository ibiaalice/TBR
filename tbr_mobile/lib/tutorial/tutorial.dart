import 'package:flutter/material.dart';
import 'package:tbr_mobile/home/home_page.dart';
import 'package:tbr_mobile/tutorial/widgets/continue_button.dart';
import 'package:tbr_mobile/tutorial/widgets/tutorial_box.dart';

class TutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())),
        label: ContinueButton(),
        backgroundColor: Color(0xfff6b93b),
      ),
      body: Center(child: TutorialBox()),
    );
  }
}
