import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String texto;
  final TextEditingController controller;
  final TextInputType teclado;

  const CampoTexto(this.texto, this.controller,
      {this.teclado = TextInputType.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: controller,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: texto,
          border: const OutlineInputBorder()
        ),
      ),
    );
  }
}