import 'package:aula10_bancodados/extensions/string_extensions.dart';

class Editora {
  int? codigo;
  String nome;

  Editora({this.codigo, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nome': nome
    };
  }

  factory Editora.fromMap(Map dados) {
    return Editora(
      codigo: dados['codigo'].toString().toInt(),
      nome: dados['nome']
    );
  }
}