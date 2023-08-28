import 'package:flutter/material.dart';
import 'package:app_flutter/ui/pages/loginPage.dart';

void main() {
  runApp(YourApp());
}

class YourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca Unialfa',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
