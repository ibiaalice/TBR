import 'package:flutter/material.dart';
import 'package:tbr_mobile/data/models/book.dart';

class AddBookDialog extends StatefulWidget {
  final Book book;

  const AddBookDialog({Key key, this.book}) : super(key: key);

  @override
  _AddBookDialogState createState() => _AddBookDialogState();
}

class _AddBookDialogState extends State<AddBookDialog> {
  final _titleController = TextEditingController();
  final _genderController = TextEditingController();

  Book _currentBook = Book();

  @override
  void initState() {
    super.initState();

    if (widget.book != null) {
      _currentBook = Book.fromMap(widget.book.toMap());
    }

    _titleController.text = _currentBook.title;
    _genderController.text = _currentBook.gender;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.clear();
    _genderController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.book == null ? 'Adicionar Livro' : 'Editar Livro',
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
              autofocus: true),
          TextField(
            controller: _genderController,
            decoration: InputDecoration(labelText: 'Gênero'),
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancelar'),
        ),
        FlatButton(
          child: Text('Adicionar'),
          onPressed: () {
            _currentBook.title = _titleController.value.text;
            _currentBook.gender = _genderController.value.text;

            Navigator.of(context).pop(_currentBook);
          },
        )
      ],
    );
  }
}
