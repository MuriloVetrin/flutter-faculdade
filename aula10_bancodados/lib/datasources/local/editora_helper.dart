import 'package:aula10_bancodados/datasources/local/banco_dados.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:sqflite/sqflite.dart';

class EditoraHelper {
  static const createSQL = '''
    CREATE TABLE IF NOT EXISTS editora (
      codigo INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT
    )
  ''';

  void inserir(Editora editora) async {
    Database db = await BancoDados().db;

    await db.insert('editora', editora.toMap());

    BancoDados().fecharDb();
  }

  void alterar(Editora editora) async {
    Database db = await BancoDados().db;

    await db.update('editora', editora.toMap(),
      where: 'codigo = ?',
      whereArgs: [editora.codigo]
    );

    BancoDados().fecharDb();
  }

  void apagar(Editora editora) async {
    Database db = await BancoDados().db;

    await db.delete('editora',
      where: 'codigo = ?',
      whereArgs: [editora.codigo]
    );

    BancoDados().fecharDb();
  }

  Future<List<Editora>> getTodos() async {
    Database db = await BancoDados().db;

    List listaDados = await db.query('editora');

    /*
    List<Editora> listaRetorno = [];
    for (int i = 0; i < listaDados.length; i++) {
      listaRetorno.add(Editora.fromMap(listaDados[i]));
    }
    return listaRetorno;
    */

    return listaDados.map((e) => Editora.fromMap(e)).toList();
  }

  Future<Editora?> getEditora(int codigo) async {
    Database db = await BancoDados().db;

    List listaDados = await db.query(
      'editora',
      where: 'codigo = ?',
      whereArgs: [codigo]
    );

    if (listaDados.isNotEmpty) {
      return Editora.fromMap(listaDados.first);
    }

    return null;
  }

  Future<int> getTotal() async {
    Database db = await BancoDados().db;

    var total = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM editora')
    );

    return total ?? 0;
  }
}