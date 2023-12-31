import 'package:aula10_bancodados/datasources/local/editora_helper.dart';
import 'package:aula10_bancodados/datasources/local/livro_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  static final BancoDados _instance = BancoDados._internal();
  BancoDados._internal();
  factory BancoDados() => _instance;

  Database? _db;
  Future<Database> get db async {
    _db = await _iniciarDb();
    return _db!;
  }

  Future<Database> _iniciarDb() async {
    const nomeBanco = 'meus_livros.db';
    final caminho = await getDatabasesPath();
    final caminhoBanco = join(caminho, nomeBanco);

    return await openDatabase(caminhoBanco, version: 1,
      onCreate: (Database db, int newVersion) async {
        await db.execute(EditoraHelper.createSQL);
        await db.execute(LivroHelper.createSQL);
      }
    );
  }

  void fecharDb() {
    _db?.close();
  }
}