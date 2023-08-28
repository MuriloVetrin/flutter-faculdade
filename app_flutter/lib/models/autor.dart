import 'package:app_flutter/helpers/extensions.dart';

class Autor {
  int codigo;
  String nome;
  String endereco;
  String cidade;
  String uf;
  String telefone;

  Autor({
    required this.codigo,
    required this.nome,
    required this.endereco,
    required this.cidade,
    required this.uf,
    required this.telefone,
  });

  factory Autor.fromMap(Map<String, dynamic> mapa) {
    int numero = (mapa['url'] ?? '')
        .toString()
        .replaceAll('', '')
        .replaceAll('', '')
        .toInt();

    return Autor(
        codigo: numero,
        nome: mapa['nome'] ?? '',
        endereco: mapa['endereco'],
        cidade: mapa['cidade'],
        uf: mapa['uf'],
        telefone: mapa['telefone']);
  }
}
