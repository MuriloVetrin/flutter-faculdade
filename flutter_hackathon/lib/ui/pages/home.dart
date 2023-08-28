import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              // Ação para exibir a lista de livros
            },
            child: Text('Lista de Livros'),
          ),
          ElevatedButton(
            onPressed: () {
              // Ação para exibir os livros reservados
            },
            child: Text('Livros Reservados'),
          ),
          ElevatedButton(
            onPressed: () {
              // Ação para exibir os detalhes do aluno
            },
            child: Text('Detalhes do Aluno'),
          ),
          SizedBox(height: 16.0),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Ação para voltar para a página de login
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
