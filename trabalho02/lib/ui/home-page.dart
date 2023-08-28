import 'package:flutter/material.dart';

class IMCPage extends StatefulWidget {
  const IMCPage({Key? key}) : super(key: key);

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  var resultado = "";

  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          criarCampoTexto("Altura (m): ", alturaController),
          criarCampoTexto("Peso (kg): ", pesoController),
          ElevatedButton(
            onPressed: calcular,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate_outlined),
                Text("Calcular"),
              ],
            ),
          ),
          Text("RESULTADO $resultado"),
        ],
      ),
    );
  }

  void calcular() {
    double altura = double.parse(alturaController.text);
    double peso = double.parse(pesoController.text);
    double imc = calcularIMC(altura, peso);
    setState(() {
      resultado = "Seu IMC é ${imc.toStringAsFixed(2)}";
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Calculadora de IMC'),
          content: Text(resultado),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  double calcularIMC(double altura, double peso) {
    return peso / (altura * altura);
  }

  Widget criarCampoTexto(String texto, TextEditingController controlador) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          labelText: texto, 
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
