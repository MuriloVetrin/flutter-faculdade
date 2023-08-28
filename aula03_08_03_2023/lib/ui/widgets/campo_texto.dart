import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  String texto;
  String? prefixo; //? indica que permite valor nulo
  TextEditingController controlador;
  TextInputType? teclado;

  //objetos que estao entre chaves {}, sao os objetos
  // nomeados, e nesse caso, sao opcionais
  CampoTexto(
      this.controlador, this.texto, //parametros obrigatorios
      {this.prefixo, this.teclado, Key? key}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controlador,
        //?? -> IF, se o valor do teclado é nulo, assume o .text
        keyboardType: teclado ?? TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
          prefixText: prefixo
        ),
      ),
    );
  }
}