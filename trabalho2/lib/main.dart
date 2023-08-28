import 'package:flutter/material.dart';
import 'ui/calculo_home.dart';
import 'ui/outra_pagina.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => CalculoHome(),
        '/outra_pagina': (context) => OutraPagina(),
      },
    );
  }
}
