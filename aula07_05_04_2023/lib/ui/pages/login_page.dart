import 'package:aula07_05_04_2023/ui/pages/home_page.dart';
import 'package:aula07_05_04_2023/ui/widgets/barra_titulo.dart';
import 'package:aula07_05_04_2023/ui/widgets/botao.dart';
import 'package:aula07_05_04_2023/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usuarioController = TextEditingController();
  var senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BarraTitulo(),

          CampoTexto(usuarioController),
          CampoTexto(senhaController),

          Botao('Entrar', _efetuarLogin),
        ],
      ),
    );
  }

  void _efetuarLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const HomePage()
    ));
  }
}
