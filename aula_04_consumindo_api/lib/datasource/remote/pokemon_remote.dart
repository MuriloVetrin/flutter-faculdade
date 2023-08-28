import 'package:aula_04_consumindo_api/infra/cliente_http.dart';
import 'package:aula_04_consumindo_api/models/pokemon.dart';

class PokemonRemote {
  final link = "https://pokeapi.co/api/v2/pokemon?limit=151";

  Future<List<Pokemon>> get() async {
    var dados = await ClienteHttp().getJson(link);
    List<dynamic> lista = dados['results'];

    return lista.map((e) => Pokemon.fromMap(e)).toList();
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