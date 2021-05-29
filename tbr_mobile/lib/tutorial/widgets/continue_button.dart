import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Continuar',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 30),
        Icon(Icons.arrow_forward_ios_sharp),
      ],
    );
  }
}
