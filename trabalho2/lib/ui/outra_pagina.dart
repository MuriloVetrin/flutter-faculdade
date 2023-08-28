import 'package:flutter/material.dart';

class OutraPagina extends StatelessWidget {
  const OutraPagina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O cálculo do índice de massa corporal (IMC) é feito usando a fórmula:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "IMC = peso / (altura * altura)\n\nOnde:\n\npeso: é o peso da pessoa em quilogramas (kg)\naltura: é a altura da pessoa em metros (m)\nIMC: é o índice de massa corporal, que representa uma medida da relação entre o peso e a altura da pessoa.\n\nPor exemplo, se uma pessoa tem um peso de 70kg e uma altura de 1,75m, o cálculo do seu IMC seria:\n\nIMC = 70 / (1.75 * 1.75) = 22.86\n\nO valor do IMC pode ser usado para avaliar se uma pessoa está dentro de uma faixa considerada saudável para sua altura e peso. Por exemplo, de acordo com a Organização Mundial da Saúde (OMS), um IMC entre 18,5 e 24,9 é considerado saudável para adultos. Valores abaixo de 18,5 indicam magreza e valores acima de 25 indicam sobrepeso ou obesidade. É importante lembrar que o IMC é apenas uma medida de referência e não deve ser usado como uma medida definitiva da saúde de uma pessoa. Outros fatores, como a composição corporal e o estilo de vida, também devem ser levados em consideração.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}