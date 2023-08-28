import 'package:aula10_bancodados/datasources/local/livro_helper.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/models/livro.dart';

class ListaLivroBloc {
  final _helper = LivroHelper();

  Future<List<Livro>> getLivroByEditora(Editora editora) {
    return _helper.getByEditora(editora.codigo ?? 0);
  }
  
  void apagar(Livro livro) {
    _helper.apagar(livro);
  }
}