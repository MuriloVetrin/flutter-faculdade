import 'package:flutter/material.dart';

class CirculoEspera extends StatelessWidget {
  const CirculoEspera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        child: Column(
          children: const [
            CircularProgressIndicator(strokeWidth: 5,),
            Text('Carregando...'),
          ],
        ),
      ),
    );
  }
}
