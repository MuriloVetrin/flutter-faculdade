import 'package:provamurilo/ui/widgets/botao_icone.dart';
import 'package:provamurilo/ui/widgets/botao_quadrado.dart';
import 'package:provamurilo/ui/widgets/campo_texto.dart';
import 'package:provamurilo/ui/widgets/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagens'),
        centerTitle: true,
        actions: [ BotaoIcone(Icons.share, _enviarClique) ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade300),
              child: const Text('Mensagens')
            ),
            ItemMenu(Icons.share, 'Compartilhar', _enviarClique),
          ],
        ),
      ),
      body: Column(
        children: [
          CampoTexto('Mensagem: ', mensagemController),
          const SizedBox(height: 32),
          BotaoQuadrado(const Text('Enviar'), _enviarClique),
        ],
      ),
    );
  }

  void _enviarClique() {
    Share.share(mensagemController.text);
  }
}