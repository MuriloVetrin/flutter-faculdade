import 'package:aula10_bancodados/datasources/local/editora_helper.dart';
import 'package:aula10_bancodados/models/editora.dart';

class ListaEditoraBloc {
  final _helper = EditoraHelper();

  Future<List<Editora>> getTodos() {
    return _helper.getTodos();
  }

  void apagar(Editora editora) {
    _helper.apagar(editora);
  }
}