import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/livros.dart';

class DetalhesLivros extends StatefulWidget {
  final String livroId;

  DetalhesLivros({required this.livroId});

  @override
  _DetalhesLivrosState createState() => _DetalhesLivrosState();
}

class _DetalhesLivrosState extends State<DetalhesLivros> {
  late Livros livro;

  @override
  void initState() {
    super.initState();
    fetchLivroDetails();
  }

  Future<void> fetchLivroDetails() async {
    final response = await http.get(Uri.parse('app/books/{Id}'));

    if (response.statusCode == 200) {
      final livroData = json.decode(response.body);
      setState(() {
        livro = Livros.fromMap(livroData);
      });
    } else {
      throw Exception('Falha ao carregar os detalhes do livro.');
    }
  }

  void voltarParaListaLivros() {
    Navigator.pop(context);
  }

  void favoritarLivro() {
    // Implemente a lógica para favoritar o livro e adicionar na tabela reservation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Livro'),
      ),
      body: livro != null
          ? Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    livro.nome,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Código: ${livro.codigo}'),
                  Text('Legenda: ${livro.legenda}'),
                  Text('ISBN: ${livro.isbn}'),
                  Text('Lugar: ${livro.lugar}'),
                  Text('Ano: ${livro.ano}'),
                  Text('Autor: ${livro.autor}'),
                  Text('Editora: ${livro.editora}'),
                  // Outros detalhes do livro...

                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: voltarParaListaLivros,
                        child: Text('Voltar'),
                      ),
                      SizedBox(width: 16),
                      RaisedButton(
                        onPressed: favoritarLivro,
                        child: Text('Favoritar Livro'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
