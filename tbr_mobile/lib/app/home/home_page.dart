import 'package:flutter/material.dart';
import 'package:tbr_mobile/app/home/widgets/add_book_dialog.dart';
import 'package:tbr_mobile/app/home/widgets/header.dart';
import 'package:tbr_mobile/data/models/book.dart';
import 'package:tbr_mobile/helpers/book_helper.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> _bookList = [];
  BookHelper _helper = BookHelper();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _helper.getAll().then(
      (list) {
        setState(
          () {
            _isLoading = false;
            _bookList = list;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xffeb2f06),
        onPressed: _addNewBook,
        label: Row(
          children: [
            Icon(Icons.add),
            Text(
              'Adicionar Livro',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Header(books: _bookList),
          Expanded(
            child: Container(
              child: _buildBookList(),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _header() {

  // }

  Widget _buildBookList() {
    if (_bookList.isEmpty) {
      return Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text('Sem Livros na sua lista'),
      );
    } else {
      return ListView.builder(
        itemBuilder: _buildBookItemSlidable,
        itemCount: _bookList.length,
      );
    }
  }

  Widget _buildTaskItem(BuildContext context, int index) {
    final book = _bookList[index];
    return Card(
      child: ListTile(
        title: Text(book.title),
        subtitle: Text(book.gender),
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Color(0xfff6b93b),
        ),
        trailing: Icon(
          Icons.menu_book_sharp,
          color: Color(0xff079992),
        ),
      ),
    );
  }

  Widget _buildBookItemSlidable(BuildContext context, int index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: _buildTaskItem(context, index),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Editar',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {
            _addNewBook(editedBook: _bookList[index], index: index);
          },
        ),
        IconSlideAction(
          caption: 'Excluir',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            _deleteBook(deletedBook: _bookList[index], index: index);
          },
        ),
      ],
    );
  }

  Future _addNewBook({Book editedBook, int index}) async {
    final task = await showDialog<Book>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AddBookDialog(
          book: editedBook,
        );
      },
    );

    if (task != null) {
      setState(() {
        if (index == null) {
          _bookList.add(task);
          _helper.save(task);
        } else {
          _bookList[index] = task;
          _helper.update(task);
        }
      });
    }
  }

  void _deleteBook({Book deletedBook, int index}) {
    setState(() {
      _bookList.removeAt(index);
    });

    _helper.delete(deletedBook.id);

    Flushbar(
      title: "Excluir livro",
      message: "Livro \"${deletedBook.title}\" removido da lista.",
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      duration: Duration(seconds: 3),
      mainButton: FlatButton(
        child: Text(
          "Desfazer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            _bookList.insert(index, deletedBook);
            _helper.update(deletedBook);
          });
        },
      ),
    )..show(context);
  }
}
