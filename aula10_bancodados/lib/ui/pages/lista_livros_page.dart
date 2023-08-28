import 'package:aula10_bancodados/blocs/lista_livro_bloc.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/models/livro.dart';
import 'package:aula10_bancodados/ui/pages/cad_livro_page.dart';
import 'package:aula10_bancodados/ui/widgets/circulo_espera.dart';
import 'package:aula10_bancodados/ui/widgets/item_dismissible.dart';
import 'package:flutter/material.dart';

class ListaLivrosPage extends StatefulWidget {
  final Editora editora;

  const ListaLivrosPage(this.editora, {Key? key}) : super(key: key);

  @override
  State<ListaLivrosPage> createState() => _ListaLivrosPageState();
}

class _ListaLivrosPageState extends State<ListaLivrosPage> {
  final _bloc = ListaLivroBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editora.nome),
        centerTitle: true ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _bloc.getLivroByEditora(widget.editora),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CirculoEspera();
            default:
              if (snapshot.hasError) {
                return Text('Deu erro: ${snapshot.error}');
              }
              return _criarLista(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _criarLista(List<Livro> listaDados) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: listaDados.length,
      itemBuilder: (context, index) {
        return ItemDismissible(
          item: _criarItem(listaDados[index]),
          titulo1: 'Editar Livro',
          evento1: () { _abrirCadastro(livro: listaDados[index]); },
          corFundo1: Colors.blue,
          titulo2: 'Excluir Livro',
          evento2: () { _bloc.apagar(listaDados[index]); },
          corFundo2: Colors.red,
          txtExclusao: 'Deseja excluir esse Livro?',
        );
      }
    );
  }

  Widget _criarItem(Livro livro) {
    return GestureDetector(
      onTap: () { _abrirCadastro(livro: livro); },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(livro.nome, style: const TextStyle(fontSize: 22),),
            ],
          ),
        ),
      ),
    );
  }

  void _abrirCadastro({Livro? livro}) async {
    await Navigator.push(context, MaterialPageRoute(
      builder: (context) => CadLivroPage(widget.editora, livro: livro,))
    );

    setState(() { });
  }
}