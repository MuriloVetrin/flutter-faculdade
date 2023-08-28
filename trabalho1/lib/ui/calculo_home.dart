import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var resultado = "";

  final kmController = TextEditingController();
  final precoController = TextEditingController();
  final consumoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trabalho1"),
        centerTitle: true,
      ),
      body: Column(
        children: [
       
          criarCampoTexto("Distância em KM: ", kmController),

          criarCampoTexto("Preço do combustível: ", precoController),

          criarCampoTexto("Média de consumo do veículo: ", consumoController),

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
    
    double km = double.parse(kmController.text);
    double preco = double.parse(precoController.text);
    double consumo = double.parse(consumoController.text);
    double custo = (km / consumo) * preco;

 showDialog(
    context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Trabalho 1'),
          content: Text('O custo da viagem é R\$ ${custo.toStringAsFixed(2)}'),
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

//Murilo
//RA: 9055