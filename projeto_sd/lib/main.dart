import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projetos Unifesspa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: LoginPage(),// Aqui será instanciado a classe da tela inicial
      //MyHomePage(title: 'Projetos | Unifesspa'),
    );
  }
}

