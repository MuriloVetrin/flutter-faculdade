import 'package:flutter/material.dart';

class BotaoIcone extends StatelessWidget {
  final IconData icone;
  final VoidCallback clique;

  const BotaoIcone(this.icone, this.clique, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: clique,
      icon: Icon(icone, size: 28, color: Colors.white)
    );
  }
}