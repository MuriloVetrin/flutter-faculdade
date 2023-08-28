import 'package:trabalhoapi/infra/cliente_http.dart';
import 'package:trabalhoapi/models/character.dart';

class CharacterRemote {
  final link = "https://rickandmortyapi.com/api/character?page=1";

  Future<List<Character>> get() async {
    var dados = await ClienteHttp().getJson(link);
    List<dynamic> lista = dados['results'];

    return lista.map((e) => Character.fromMap(e)).toList();
    /*
    List<Emissora> lista = [];
    for (var i = 0; i < dados.length; i++) {
      var item = Emissora.fromMap(dados[i]);
      lista.add(item);
    }
    return lista;
    */
  }
}