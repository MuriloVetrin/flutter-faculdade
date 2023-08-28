import 'package:aula10_bancodados/blocs/lista_editora_bloc.dart';
import 'package:aula10_bancodados/models/editora.dart';
import 'package:aula10_bancodados/ui/pages/cad_editora_page.dart';
import 'package:aula10_bancodados/ui/pages/lista_livros_page.dart';
import 'package:aula10_bancodados/ui/widgets/circulo_espera.dart';
import 'package:aula10_bancodados/ui/widgets/item_dismissible.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = ListaEditoraBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.menu_book_outlined),
            SizedBox(width: 8,),
            Text('Meus Livros')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _bloc.getTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const CirculoEspera();
            default:
              if (snapshot.hasError) {
                return Text('Deu erro: ${snapshot.error}');
              }
              else {
                return _criarLista(snapshot.data!);
              }
          }
        },
      ),
    );
  }

  Widget _criarLista(List<Editora> dados) {
    return ListView.builder(
      itemCount: dados.length,
      itemBuilder: (context, index) {
        return ItemDismissible(
          item: _criarItemLista(dados[index]),
          titulo1: 'Editar Editora',
          corFundo1: Colors.blue,
          evento1: () { _abrirCadastro(editora: dados[index]); },
          titulo2: 'Excluir Editora',
          corFundo2: Colors.red,
          evento2: () { _bloc.apagar(dados[index]); },
          txtExclusao: 'Deseja realmente excluir essa Editora?',
        );
      }
    );
  }

  Widget _criarItemLista(Editora editora) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ListaLivrosPage(editora)));
      },
      onLongPress: () { _abrirCadastro(editora: editora); },
      child: Card(
        child: Row(
        children: [
        Padding(
            padding: const EdgeInsets.all(16),
              child: Text(editora.nome, style: const TextStyle(fontSize: 22),),
            ),
          ],
        ),
      ),
    );
  }

  //quando usamos os {}, indica que este parametro é nomeado e opcional
  //  o metodo pode ser chamado tanto passando a editora como sem nada
  //Se nao enviar nada, é um cadastro novo
  //S enviar a editora, carrega a editora enviada para edição
  void _abrirCadastro({Editora? editora}) async {
    await Navigator.push(context, MaterialPageRoute(
        builder: (context) => CadEditoraPage(editora: editora)));

    setState(() { });
  }
}