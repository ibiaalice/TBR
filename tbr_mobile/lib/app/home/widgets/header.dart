import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final int qtdBooks;

  const Header({Key key, @required this.qtdBooks}) : super(key: key);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFF82ccdd),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/icon_header.png',
            scale: 5,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color(0xff38ada9),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        'Livros na lista',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.qtdBooks.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
