import 'package:flutter/material.dart';
import 'pages/character_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CharacterListScreen(),
    );
  }
}
