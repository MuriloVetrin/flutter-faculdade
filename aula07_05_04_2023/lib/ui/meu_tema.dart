import 'package:flutter/material.dart';

ThemeData meuTema() {
  const corPrimaria = Color(0xFF12159F);
  const corPrimariaEscura = Color(0xFF00024E);
  const corPrimariaClara = Color(0xFF3F42FF);

  final inputDecoration = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: corPrimariaEscura, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: corPrimariaClara, width: 3),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  final buttonDecoration = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(corPrimaria),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 28, vertical: 18)
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
    )
  );

  const appBarDecoration = AppBarTheme(
    color: corPrimaria,
    titleTextStyle: TextStyle(fontSize: 28, color: Colors.white),
    centerTitle: true
  );

  return ThemeData(
    primaryColor: corPrimaria,
    primaryColorDark: corPrimariaEscura,
    primaryColorLight: corPrimariaClara,
    appBarTheme: appBarDecoration,
    inputDecorationTheme: inputDecoration,
    elevatedButtonTheme: buttonDecoration,
  );
}