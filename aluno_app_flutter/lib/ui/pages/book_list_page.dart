import 'package:flutter/material.dart';
import 'package:aluno_app_flutter/ui/widgets/book_item.dart';

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BookItem(book: book);
        },
      ),
    );
  }
}
