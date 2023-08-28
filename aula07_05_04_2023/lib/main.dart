import 'package:aula07_05_04_2023/ui/meu_tema.dart';
import 'package:aula07_05_04_2023/ui/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login App',
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
    theme: meuTema(),
  ));
}