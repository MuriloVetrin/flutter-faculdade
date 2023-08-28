import 'package:aula10_bancodados/datasources/local/livro_helper.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/models/livro.dart';
import 'package:aula10_bancodados/ui/widgets/botao_texto.dart';
import 'package:aula10_bancodados/ui/widgets/mensagem_alerta.dart';
import 'package:aula10_bancodados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class CadLivroBloc {
  final _helper = LivroHelper();
  final nomeController = TextEditingController();

  final BuildContext context;
  final Editora editora;
  final Livro? livro;

  CadLivroBloc({required this.context, required this.editora, this.livro}) {
    nomeController.text = emEdicao ? livro!.nome : '';
  }

  bool get emEdicao => livro != null;

  void salvar() {
    if (nomeController.text.trim().isEmpty) {
      MensagemAlerta().show(
        context: context,
        titulo: 'Atenção',
        texto: 'Campo Nome do Livro é obrigatório!'
      );
      return;
    }

    final dados = Livro(nome: nomeController.text, editora: editora);

    if (emEdicao) {
      dados.codigo = livro!.codigo;
      _helper.alterar(dados);
    }
    else {
      _helper.inserir(dados);
    }

    Navigator.pop(context);
  }

  void excluir() {
    MensagemPopup().show(context: context,
        titulo: 'Atenção',
        texto: 'Deseja realmente excluir esse Livro?',
        botoes: [
          BotaoTexto(clique: _confirmarExcluir, texto: 'Sim',
            corTexto: Colors.red.shade900,
          ),
          BotaoTexto(clique: () { Navigator.pop(context); }, texto: 'Não'),
        ]
    );
  }

  void _confirmarExcluir() {
    if (emEdicao) {
      _helper.apagar(livro!);
    }

    Navigator.pop(context); //fechar o popup da mensagem
    Navigator.pop(context); //fechar a tela de cadastro
  }
}