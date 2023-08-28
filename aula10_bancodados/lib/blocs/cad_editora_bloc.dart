import 'package:aula10_bancodados/datasources/local/editora_helper.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/ui/widgets/botao_texto.dart';
import 'package:aula10_bancodados/ui/widgets/mensagem_alerta.dart';
import 'package:aula10_bancodados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class CadEditoraBloc {
  final _helper = EditoraHelper();
  final nomeController = TextEditingController();

  final BuildContext context;
  final Editora? editora;

  CadEditoraBloc({required this.context, this.editora}) {
    nomeController.text = emEdicao ? editora!.nome : '';
  }

  bool get emEdicao => editora != null;

  void salvar() {
    if (nomeController.text.trim().isNotEmpty) {
      final dados = Editora(nome: nomeController.text.trim());

      if (emEdicao) {
        //se recebeu, realiza o update na editora, mantendo o codigo original
        dados.codigo = editora!.codigo;
        _helper.alterar(dados);
      }
      else {
        //senao recebeu, realiza o insert com o nome digitado
        _helper.inserir(dados);
      }

      Navigator.pop(context);
    }
    else {
      MensagemAlerta().show(context: context,
        titulo: 'Atenção', texto: 'Nome da editora é obrigatório!');
    }
  }

  void excluir() {
    MensagemPopup().show(context: context,
      titulo: 'Atenção',
      texto: 'Deseja realmente excluir essa editora?',
      botoes: [
        BotaoTexto(clique: _confirmarExcluir, texto: 'Sim',
          corTexto: Colors.red.shade900,
        ),
        BotaoTexto(clique: () { Navigator.pop(context); }, texto: 'Não'),
      ]
    );
  }

  void _confirmarExcluir() {
    //verificando se foi recebido da tela principal uma editora
    if (emEdicao) {
      _helper.apagar(editora!);
    }

    Navigator.pop(context); //fechar o popup da mensagem
    Navigator.pop(context); //fechar a tela de cadastro
  }
}