import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/alunos.dart';

class DetalhesAlunos extends StatefulWidget {
  final int alunoId;

  DetalhesAlunos({required this.alunoId});

  @override
  _DetalhesAlunosState createState() => _DetalhesAlunosState();
}

class _DetalhesAlunosState extends State<DetalhesAlunos> {
  late Future<Map<String, dynamic>> _alunoFuture;

  @override
  void initState() {
    super.initState();
    _alunoFuture = fetchAluno(widget.alunoId);
  }

  Future<Map<String, dynamic>> fetchAluno(int alunoId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/students/$alunoId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar os detalhes do aluno.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Aluno'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _alunoFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final alunoData = snapshot.data!;
            return Column(
              children: [
                ListTile(
                  title: Text('Nome:'),
                  subtitle: Text(alunoData['nome']),
                ),
                ListTile(
                  title: Text('RA:'),
                  subtitle: Text(alunoData['ra']),
                ),
                ListTile(
                  title: Text('Endereço:'),
                  subtitle: Text(alunoData['endereco']),
                ),
                ListTile(
                  title: Text('Cidade:'),
                  subtitle: Text(alunoData['cidade']),
                ),
                ListTile(
                  title: Text('UF:'),
                  subtitle: Text(alunoData['uf']),
                ),
                ListTile(
                  title: Text('Telefone:'),
                  subtitle: Text(alunoData['telefone']),
                ),
                ListTile(
                  title: Text('Curso:'),
                  subtitle: Text(alunoData['curso']),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Erro ao carregar os detalhes do aluno.');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
