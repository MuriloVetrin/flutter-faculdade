import 'package:flutter/material.dart';
import 'package:aluno_app_flutter/models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  BookDetailsScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Livro'),
      ),
      body: Column(
        children: [
          // Exibir os detalhes do livro aqui
        ],
      ),
    );
  }
}
