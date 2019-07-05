import "package:flutter/material.dart";
// import 'package:projeto_sd/lib/home.dart';

import 'Aluno.dart';
import 'autenticacao.dart';
import 'home.dart';



class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Authentication auth = Authentication();

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 5)).then((onValue) => {
          
          auth.signInWithGoogle().then((user) {
            Aluno discente = new Aluno(user);

            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen(discente)));
          })
        });
  }

  String status = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Cor
      backgroundColor: Theme.of(context).primaryColor,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("images/Logo_proj_sd(05)3.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // CircularProgressIndicator(
              //   backgroundColor: Colors.white,
              // ),
              Text(
                "Carregando",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
              ),

              Divider(height: 10,),
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30),
                child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
              ),
              


            ],
          )
        ],
      ),
    );
  }
}
