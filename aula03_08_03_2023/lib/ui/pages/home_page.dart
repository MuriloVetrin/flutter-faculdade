import 'package:aula03_08_03_2023/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //criando os 2 controladores para o campoTexto das notas
  final nota1Controller = TextEditingController();
  final nota2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Scaffold -> estrutura de tela completa (com appbar, body)
    return Scaffold(
      //AppBar -> barra de titulo do App
      appBar: AppBar(title: Text('Minhas Notas')),
      //Column -> Permite adicionar varios filhos, na vertical
      body: Column(
        children: [
          CampoTexto(
            nota1Controller,
            'Nota 1: ',
            teclado: TextInputType.number
          ),

          CampoTexto(
            nota2Controller,
            'Nota 2: ',
            prefixo: '-> ',
            teclado: TextInputType.number,
          ),

          BotaoQuadrado('Calcular', _calcular),
        ],
      ),
    );
  }

  //metodos que comecam com underline (_) sao metodos privados
  void _calcular() {
    //double.parse -> converte o texto do campo em valor double
    var nota1 = double.parse(nota1Controller.text);
    var nota2 = double.parse(nota2Controller.text);
    var media = (nota1 + nota2) / 2;

    if (media >= 7) {
      mostrarMensagem("Aprovado");
    } else {
      mostrarMensagem("Reprovado");
    }
  }

  void mostrarMensagem(String texto) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text(texto),
          actions: [
            BotaoQuadrado('Ok', () { Navigator.pop(context); })
          ],
        );
      }
    );
  }
}
