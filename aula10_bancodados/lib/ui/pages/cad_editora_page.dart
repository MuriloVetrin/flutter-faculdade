import 'package:aula10_bancodados/blocs/cad_editora_bloc.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/ui/widgets/botao_quadrado.dart';
import 'package:aula10_bancodados/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadEditoraPage extends StatefulWidget {
  final Editora? editora;

  const CadEditoraPage({this.editora, Key? key}) : super(key: key);

  @override
  State<CadEditoraPage> createState() => _CadEditoraPageState();
}

class _CadEditoraPageState extends State<CadEditoraPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = CadEditoraBloc(context: context, editora: widget.editora);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Editora'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CampoTexto(controller: bloc.nomeController, texto: 'Nome'),

            BotaoQuadrado(
              clique: bloc.salvar,
              titulo: 'Salvar',
              corBotao: Colors.green.shade900
            ),

            _criarBotaoExcluir(bloc),
          ],
        ),
      ),
    );
  }

  Widget _criarBotaoExcluir(CadEditoraBloc bloc) {
    //verificando se foi recebido da tela principal uma editora
    if (bloc.emEdicao) {
      return BotaoQuadrado(
        clique: bloc.excluir,
        titulo: 'Excluir',
        corBotao: Colors.red.shade900,
      );
    }
    return Container();
  }
}