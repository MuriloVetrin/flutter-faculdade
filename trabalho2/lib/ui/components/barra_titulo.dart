import 'package:flutter/material.dart';

class BarraTitulo extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  BarraTitulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
