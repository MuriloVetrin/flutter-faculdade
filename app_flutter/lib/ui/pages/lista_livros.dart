import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_flutter/models/livros.dart';
import 'package:app_flutter/pages/detalhes_livros.dart';

class ListaLivrosPage extends StatefulWidget {
  @override
  _ListaLivrosPageState createState() => _ListaLivrosPageState();
}

class _ListaLivrosPageState extends State<ListaLivrosPage> {
  List<Livros> livros = [];

  @override
  void initState() {
    super.initState();
    fetchLivros();
  }

  Future<void> fetchLivros() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/app'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        livros = List<Livros>.from(data.map((livro) => Livros.fromMap(livro)));
      });
    } else {
      throw Exception('Falha ao carregar os livros');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Livros'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Detalhes do Aluno'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesAlunos(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Livros Reservados'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaLivrosCurso(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];
          return ListTile(
            title: Text(livro.nome),
            subtitle: Text(livro.legenda),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesLivros(livro: livro),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
