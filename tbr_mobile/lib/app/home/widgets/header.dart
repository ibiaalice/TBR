import 'package:flutter/material.dart';
import 'package:tbr_mobile/data/models/book.dart';
import 'dart:math';

class Header extends StatefulWidget {
  final List<Book> books;

  const Header({Key key, @required this.books}) : super(key: key);
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
                      widget.books.length.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () => _emitAlert(),
            child: Card(
              shadowColor: Colors.black,
              color: Color(0xffeb2f06),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(180)),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sortear livro',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _emitAlert() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (widget.books.isEmpty) {
            return AlertDialog(
              title: Text('Não há livros na lista'),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Sair'),
                ),
              ],
            );
          } else {
            Book book = _raffleBook();

            return AlertDialog(
              title: Row(
                children: [
                  Image.asset('assets/livro.png', scale: 10),
                  SizedBox(width: 10),
                  Text('O livro sorteado foi...')
                ],
              ),
              content: Container(
                height: 100,
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      book.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(book.gender),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Sair'),
                ),
              ],
            );
          }
        });
  }

  Book _raffleBook() {
    Random random = new Random();

    Book result = widget.books[random.nextInt(widget.books.length)];

    return result;
  }
}
