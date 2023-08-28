import 'package:aula_04_consumindo_api/datasource/remote/pokemon_remote.dart';
import 'package:flutter/material.dart';

import '../widgets/carregando.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.tv),
            SizedBox(width: 8),
            Text('Minhas Emissoras'),
          ],
        ),
        //backgroundColor: Color(0xFF000000),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: PokemonRemote().get(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Carregando();
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(41),
                child: Card(
                  child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(snapshot.data![index].nome,
                      style: const TextStyle(fontSize: 40),
                  ),
                 ),
                ),
               );
            }
          );
        },
      ),
    );
  }
}