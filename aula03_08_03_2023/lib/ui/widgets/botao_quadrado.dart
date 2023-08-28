import 'package:flutter/material.dart';

class BotaoQuadrado extends StatelessWidget {
  final String texto;
  final VoidCallback onClique;

  const BotaoQuadrado(this.texto, this.onClique, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClique,
      child: Text(texto)
    );
  }
}
