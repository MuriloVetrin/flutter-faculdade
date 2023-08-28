import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/character.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character?page=1'));
    final data = jsonDecode(response.body);
    setState(() {
      characters = (data['results'] as List)
          .map((json) => Character.fromJson(json))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Personagens')),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (ctx, index) {
          final character = characters[index];
          return ListTile(
            title: Text(character.name),
            onTap: () {
              // Navegar para a tela de detalhes do personagem
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CharacterDetailsScreen(character: character),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
