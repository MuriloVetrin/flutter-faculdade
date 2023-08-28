import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold -> cria a estrutura de tela
    return Scaffold(
      //AppBar -> Barra de titulo da tela
      appBar: AppBar(title: Text("Aula 01")),
      body: Text("Relou Uordi"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add_alarm_outlined),
      ),
    );
  }
}
