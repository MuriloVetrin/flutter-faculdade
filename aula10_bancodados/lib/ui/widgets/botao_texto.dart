import 'package:flutter/material.dart';

class BotaoTexto extends StatelessWidget {
  final String texto;
  final VoidCallback clique;
  final Color? corTexto;

  const BotaoTexto({
    required this.clique,
    required this.texto,
    this.corTexto,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clique,
      style: TextButton.styleFrom(foregroundColor: corTexto),
      child: Text(texto)
    );
  }
}