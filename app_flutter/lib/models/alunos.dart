import 'package:app_flutter/helpers/extensions.dart';

class Alunos {
  int codigo;
  String ra;
  String nome;
  String endereco;
  String cidade;
  String uf;
  String telefone;
  String curso;

  Alunos({required this.codigo,
  required this.ra,
  required this.nome,
  required this.endereco,
  required this.cidade,
  required this.uf,
  required this.telefone,
  required this.curso});

  factory Alunos.fromMap(Map<String, dynamic> mapa){
    int numero = (mapa['url'] ?? '').toString()
    .replaceAll('', '')
    .replaceAll('', '').toInt();

    return Alunos(
      codigo: numero,
      ra: mapa['ra'],
      nome: mapa['name'],
      endereco: mapa['address'],
      cidade: mapa['city'],
      uf: mapa['uf'],
      telefone: mapa['phone'],
      curso: mapa['course']
    );
  }
}