import 'package:aula10_bancodados/ui/widgets/botao_quadrado.dart';
import 'package:aula10_bancodados/ui/widgets/botao_texto.dart';
import 'package:aula10_bancodados/ui/widgets/mensagem_popup.dart';
import 'package:flutter/material.dart';

class ItemDismissible extends StatelessWidget {
  final Widget item;

  final String titulo1;
  final VoidCallback evento1;
  final Color? corFundo1;
  final Color? corTexto1;

  final String? titulo2;
  final VoidCallback? evento2;
  final Color? corFundo2;
  final Color? corTexto2;

  final String? txtExclusao;

  const ItemDismissible({
    required this.item,
    required this.titulo1,
    required this.evento1,
    this.corFundo1,
    this.corTexto1,
    this.titulo2,
    this.evento2,
    this.corFundo2,
    this.corTexto2,
    this.txtExclusao,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      child: item,
      background: Container(
        alignment: const Alignment(-1, 0),
        color: corFundo1,
        child: Text(titulo1, style: TextStyle(color: corTexto1, fontSize: 20)),
      ),
      secondaryBackground: Container(
        alignment: const Alignment(1, 0),
        color: corFundo2,
        child: Text(titulo2 ?? '', style: TextStyle(color: corTexto2, fontSize: 20)),
      ),
      onDismissed: (direcao) {
        if (direcao == DismissDirection.startToEnd) {
          evento1();
        }
        else if (direcao == DismissDirection.endToStart) {
          evento2!();
        }
      },
      confirmDismiss: (direcao) async {
        if (txtExclusao != null && direcao == DismissDirection.endToStart) {
          return await MensagemPopup().show(
            context: context,
            titulo: 'Atenção',
            texto: txtExclusao!,
            botoes: [
              BotaoTexto(texto: 'Sim', clique: () {
                Navigator.of(context).pop(true);
              }),
              BotaoQuadrado(titulo: 'Não', clique: () {
                Navigator.of(context).pop(false);
              }),
            ]
          );
        }
        return true;
      },
    );
  }
}
