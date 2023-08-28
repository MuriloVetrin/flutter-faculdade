import 'package:aula10_bancodados/extensions/string_extensions.dart';
import 'package:aula10_bancodados/models/editora.dart';

class Livro {
  int? codigo;
  String nome;
  Editora editora;

  Livro({
    this.codigo,
    required this.nome,
    required this.editora
  });

  factory Livro.fromMap(Map dados, Editora editora) {
    return Livro(
      codigo: dados['codigo'].toString().toInt(),
      nome: dados['nome'],
      editora: editora
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nome': nome,
      'cod_editora': editora.codigo
    };
  }
}