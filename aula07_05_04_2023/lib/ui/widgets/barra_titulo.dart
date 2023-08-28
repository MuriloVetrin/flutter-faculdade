import 'package:flutter/material.dart';

class BarraTitulo extends StatelessWidget {
  const BarraTitulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
          ]
        ),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(100)
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black
          )
        ],
      ),
      child: const Icon(Icons.lock, size: 80, color: Colors.white),
    );
  }
}