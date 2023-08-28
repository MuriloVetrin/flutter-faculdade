import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final String titulo;
  final VoidCallback clique;
  final Color? corBotao;

  const BotaoQuadrado({
    required this.clique,
    required this.titulo,
    this.corBotao,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clique,
      style: ElevatedButton.styleFrom(backgroundColor: corBotao),
      child: Text(titulo),
    );
  }
}