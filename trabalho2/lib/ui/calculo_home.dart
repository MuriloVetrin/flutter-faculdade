import 'package:flutter/material.dart';
import 'outra_pagina.dart';

class CalculoHome extends StatefulWidget {
  @override
  _CalculoHomeState createState() => _CalculoHomeState();
}

class _CalculoHomeState extends State<CalculoHome> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final alturaController = TextEditingController();
  final pesoController = TextEditingController();

  var resultado = "";

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

  Widget criarBotaoCalcular() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: calcular,
        child: Text('Calcular'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.calculate_outlined),
            onPressed: calcular,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              selected: _selectedIndex == 0,
              leading: Icon(Icons.calculate),
              title: Text('Página de cálculo'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              selected: _selectedIndex == 1,
              leading: Icon(Icons.info),
              title: Text('Sobre'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? Column(
              children: [
                criarCampoTexto("Altura (m): ", alturaController),
                criarCampoTexto("Peso (kg): ", pesoController),
                criarBotaoCalcular(),
                Text("RESULTADO $resultado"),
              ],
            )
          : Center(
              child: OutraPagina(),
            ),
    );
  }
}
