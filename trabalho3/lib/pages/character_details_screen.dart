import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(character.image),
            SizedBox(height: 16),
            Text('Nome: ${character.name}'),
            Text('Status: ${character.status}'),
            Text('Espécie: ${character.species}'),
          ],
        ),
      ),
    );
  }
}
