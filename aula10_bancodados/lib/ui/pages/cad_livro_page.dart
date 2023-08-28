import 'package:aula10_bancodados/blocs/cad_livro_bloc.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/models/livro.dart';
import 'package:aula10_bancodados/ui/widgets/campo_texto.dart';
import 'package:flutter/material.dart';

class CadLivroPage extends StatefulWidget {
  final Editora editora;
  final Livro? livro;

  const CadLivroPage(this.editora, {this.livro, Key? key}) : super(key: key);

  @override
  State<CadLivroPage> createState() => _CadLivroPageState();
}

class _CadLivroPageState extends State<CadLivroPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = CadLivroBloc(context: context,
      editora: widget.editora, livro: widget.livro);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Livro'),
        centerTitle: true,
        actions: [ _criarBotaoExcluir(bloc) ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: bloc.salvar,
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          CampoTexto(
            controller: bloc.nomeController,
            texto: 'Nome do Livro',
          ),
        ],
      ),
    );
  }

  Widget _criarBotaoExcluir(CadLivroBloc bloc) {
    if (bloc.emEdicao) {
      return IconButton(onPressed: bloc.excluir,
        icon: const Icon(Icons.delete_forever, size: 32,));
    }
    return const SizedBox();
  }
}