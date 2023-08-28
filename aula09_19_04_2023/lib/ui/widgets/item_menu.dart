import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final VoidCallback clique;

  const ItemMenu(this.icone, this.titulo, this.clique,
      {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: clique,
      title: Row(
        children: [
          Icon(icone, color: Colors.black),
          const SizedBox(width: 12),
          Text(titulo),
        ],
      ),
    );
  }
}
