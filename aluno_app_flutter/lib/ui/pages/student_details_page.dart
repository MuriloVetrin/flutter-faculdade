import 'package:flutter/material.dart';
import 'package:your_app/models/student.dart';

class StudentDetailsScreen extends StatelessWidget {
  final Student student;

  StudentDetailsScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Aluno'),
      ),
      body: Column(
        children: [
          // Exibir os detalhes do aluno aqui
        ],
      ),
    );
  }
}
