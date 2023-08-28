import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Minha Aplicação'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Página de Cálculo'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/calculo');
            },
          ),
          ListTile(
            title: Text('Outra Página'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/outra');
            },
          ),
        ],
      ),
    );
  }
}
