import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: MyHomePage(title: 'Projetos | Unifesspa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body:

      //Container do primeiro tile (contas a pagar)
      // BEGIN COMMENT
      Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: Column(children: <Widget>[
      
      //Teste de cores
      //Container do primeiro tile (contas a pagar)
      Container(
        color: Colors.blue,
        
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ContasReceberPage(this.user) 
                  
              //     )
              //   );
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

        color: Colors.blue,

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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ContasPagarPage(this.user) 
                  
              //     )
              //   );
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