import 'package:aula_04_consumindo_api/helpers/extensions.dart';

class Pokemon {
  int codigo;
  String nome;
  String imagem;

  Pokemon({required this.codigo, required this.nome, required this.imagem});

  factory Pokemon.fromMap(Map<String, dynamic> mapa) {

    int numero = (mapa['url'] ?? '').toString()
        .replaceAll('https://pokeapi.co/api/v2/pokemon/', '')
        .replaceAll('/', '').toInt();

    return Pokemon(
      codigo: numero,
      nome: mapa['name'] ?? '',
      imagem: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$numero.png'
    );
  }
}