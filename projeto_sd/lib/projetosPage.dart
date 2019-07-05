import 'package:flutter/material.dart';
import 'package:projeto_sd/Aluno.dart';
import 'home.dart';
import 'projetosExtensao.dart';
import 'projetosPesquisa.dart';


class ProjetosPage extends StatefulWidget {
  String _nomeFaculdade;
  Aluno user;
  ProjetosPage(this._nomeFaculdade, this.user);

  @override
  State<StatefulWidget> createState() {
    return _ProjetosPageState(this._nomeFaculdade, this.user);
  }
}

class _ProjetosPageState extends State<ProjetosPage> {
  Aluno user;
  int _counter = 0;
  String _nomeFaculdade;
  _ProjetosPageState(this._nomeFaculdade, this.user);

  // Aluno get user => null;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
      print("Faculdade passada: " + _nomeFaculdade);
    return Scaffold(
      appBar: AppBar(
        title: Text("Projetos"),
        centerTitle: true,
      ),
      body:

      //Container do primeiro tile (contas a pagar)
      // BEGIN COMMENT
      Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Column(children: <Widget>[

      Divider(
        color: Colors.transparent,
      ),

      //Teste de cores
      //Container do primeiro tile (contas a pagar)
      Container(
        // color: Colors.blue,
        color: Color.fromRGBO(58, 66, 86, .9),
        
        child: Stack(children: <Widget>[
          //Primeiro tile
      ListTile(
        
        
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          
          padding: EdgeInsets.only(right: 12.0),
        
          decoration: new BoxDecoration(
            
            border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white))
          ),
        
        //Trocar icone
        child: Icon(Icons.search, size: 35, color: Colors.white),
        ),
            
        title: 
        
        Text("Pesquisa",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
            
        trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjetosPesquisaPage(this.user, this._nomeFaculdade)                   
                  )
                );
              },
            ),
          ],
        ),
      ),

          
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Divider(color: Colors.black, height: 5,),
        ),


        Container(
        // color: Colors.red[500],
        // color: Colors.blue,
        color: Color.fromRGBO(58, 66, 86, .9),

        child: Stack(children: <Widget>[
        
        
        // Segundo tile
        ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
        
          decoration: new BoxDecoration(
            border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white))
            ),

        //Trocar icone
        child: Icon(Icons.extension, size: 35, color: Colors.white),
        ),
            
        title: Text(
          "Extensão",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
            
        trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjetosExtensaoPage(this.user, this._nomeFaculdade)                   
                  )
                );
              },
          ),




        ],)),


        

        ],),
      )
     
     
     // AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      // Center(

      //   child: Column(

      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text('$_counter',
      //         style: Theme.of(context).textTheme.display1,
      //       ),
      //     ],
      //   ),
      // ),






      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




//Main de testes:
/*
import 'package:flutter/material.dart';
import 'package:galinha_manca/login.dart';
import 'package:galinha_manca/helpers/createMaterialColor.dart';
//import 'package:galinha_manca/UI/categorias_lista.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  runApp(GalinhaManca());
}

final ThemeData kIOSTheme = ThemeData(
  primarySwatch: Colors.green,
  primaryColor: Colors.grey,
  primaryColorBrightness: Brightness.light
);

final ThemeData kDefaultTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xffEBEBEB),
  primarySwatch: createMaterialColor(Color(0xff00B13A)),
  accentColor: Colors.grey
);

class GalinhaManca extends StatelessWidget {
  const GalinhaManca({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Finanças Agricultor",
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).platform == TargetPlatform.iOS ?
        kIOSTheme : kDefaultTheme, //Define o tema de acordo com a plataforma
      home: LoginPage(),// Aqui será instanciado a classe da tela inicial
    );
  }
}







*/