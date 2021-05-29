import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  final Color color;
  final String information;
  final String title;

  const TutorialCard({
    Key key,
    this.color,
    this.information,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Colors.blue,
      child: SizedBox(
        width: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Image.asset('assets/destaque.png', scale: 4),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decorationColor: Colors.black,
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                information ?? '----',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white70,
          ),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
