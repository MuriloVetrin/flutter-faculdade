import 'package:aula10_bancodados/datasources/local/banco_dados.dart';
import 'package:aula10_bancodados/datasources/local/editora_helper.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/models/livro.dart';
import 'package:sqflite/sqflite.dart';

class LivroHelper {
  static const createSQL = '''
    CREATE TABLE IF NOT EXISTS livro (
      codigo INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      cod_editora INTEGER,
      FOREING KEY cod_editora REFERENCES editora(codigo)
    )
  ''';

  void inserir(Livro livro) async {
    Database db = await BancoDados().db;

    await db.insert('livro', livro.toMap());

    BancoDados().fecharDb();
  }

  void alterar(Livro livro) async {
    Database db = await BancoDados().db;

    await db.update(
      'livro',
      livro.toMap(),
      where: 'codigo = ?',
      whereArgs: [livro.codigo]
    );

    BancoDados().fecharDb();
  }

  void apagar(Livro livro) async {
    Database db = await BancoDados().db;

    await db.delete('livro',
      where: 'codigo = ?',
      whereArgs: [livro.codigo]
    );

    BancoDados().fecharDb();
  }

  Future<List<Livro>> getByEditora(int codEditora) async {
    Editora? editora = await EditoraHelper().getEditora(codEditora);

    if (editora != null) {
      Database db = await BancoDados().db;

      List listaDados = await db.query(
        'livro',
        where: 'cod_editora = ?',
        whereArgs: [codEditora],
        orderBy: 'nome'
      );

      return listaDados.map((e) => Livro.fromMap(e, editora)).toList();
    }

    return [];
  }
}