import 'package:aula10_bancodados/ui/widgets/botao_texto.dart';
import 'package:aula10_bancodados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class MensagemAlerta {
  Future show({
    required BuildContext context,
    required String titulo,
    required String texto
  }) {
    return MensagemPopup().show(
      context: context,
      titulo: titulo,
      texto: texto,
      botoes: [
        BotaoTexto(
          clique: () { Navigator.pop(context); },
          texto: 'Ok'
        ),
      ]
    );
  }
}