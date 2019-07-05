import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:galinha_manca/helpers/Aluno.dart';
//import 'package:intl/intl.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Aluno.dart';
import 'detailPageExtensao.dart';

//import 'package:intl/intl.dart';

//import 'package:sandbox/Categoria.dart';

// class ProjetosExtensaoPage extends StatelessWidget {
//  //Cria novos documentos se o nome do caminho for diferente
//  final DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).document("myData/dummy2");
// DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).document("projetosExtensao/contaR1");
//DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).collection("projetosExtensao").document("contaR1");
//  String myText = "Teste";
//  StreamSubscription<DocumentSnapshot> subscription;
//   //final databaseReference = FirebaseDatabase.instance.reference();

class ProjetosExtensaoPage extends StatefulWidget {
  Aluno user;
  double aux;
  String _nomeFaculdade;
  ProjetosExtensaoPage(this.user, this._nomeFaculdade);



  @override
  ProjetosExtensaoPageState createState() {
    return new ProjetosExtensaoPageState(this.user, this._nomeFaculdade);
  }
}
//Adaptar para exibir apenas a conta do usuário

class ProjetosExtensaoPageState extends State<ProjetosExtensaoPage> {
  Aluno user;
  String _nomeFaculdade;
  ProjetosExtensaoPageState(this.user, this._nomeFaculdade) {
    projetosExtensao = Firestore.instance
        .collection("faculdades")
        .document(_nomeFaculdade).collection("projetosExtensao");


        //     projetosExtensao = Firestore.instance
        // .collection("projetosExtensao")
        // .document(user.usuario.uid)
        // .collection("projetosExtensao");

    documentReference = projetosExtensao.document();
  }

  String myText = "";
  bool _validate = false; //Valida se houve texto inserido nos campos da conta

  String diaMes = "";
  String descricao = "";
  String devedor = "";
  double valor = 0;
  double aux;

  //String id = snapshot.documentID;

  // ProjetosExtensaoPage.fromDocument(DocumentSnapshot snapshot) {
  //   this.nome = snapshot.data['nome'];
  //   this.subCategorias = snapshot.data['subCategorias'];
  //   this.id = snapshot.documentID;
  // }

  double saldo = 0; //Get saldo, trocar quando tiver um saldo global
  StreamSubscription<DocumentSnapshot> subscription;

  //DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).document("projetosExtensao/contaR3");
  DocumentReference documentReference;
  CollectionReference projetosExtensao;

  final descController = TextEditingController();
  final dataController = TextEditingController();
  final devedorController = TextEditingController();
  final valorController = TextEditingController();
    
  var now = new DateTime.now();
  String data = DateTime.now().day.toString() +
      "/" +
      DateTime.now().month.toString() +
      "/" +
      DateTime.now().year.toString();

  DateTime hoje = DateTime.now();

  DateTime selecionado = DateTime.now();
  



  @override
  void dispose() {
    descController.dispose();
    dataController.dispose();
    devedorController.dispose();
    valorController.dispose();    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Projetos de extensão'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        
      ),
      body:

          //Mostrando dados do banco
      new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("faculdades")
            .document(_nomeFaculdade)
            .collection("projetosExtensao")
            .snapshots(),

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Center(child: CircularProgressIndicator());
          } else {
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];

                print("TESTE");
                print("Tamanho da lista: " + snapshot.data.documents.length.toString());
                print("Usuário: " + user.usuario.displayName);
                print("Email: " + user.usuario.email);

                return new Column(
                  children: <Widget>[
                    
                    Divider(
                      color: Colors.transparent,
                      height: 2,
                    ),

                    //Card de projeto
                    Card(
                      elevation: 8,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[

                              
                              Text(
                                "Título: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: 
                              
                              Text(
                                ds['titulo'].toString(),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                textAlign: TextAlign.left,
                              ),
                            ),

                          
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              child: Divider(color: Colors.black, height: 5,),
                            ),

                            //Descrição
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 2.0, left: 10, right: 2),
                              child: Row(children: <Widget>[

                                
                                Text(
                                  "Descrição: ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ]),                              
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 2.0, left: 10),
                              child: Text(
                                ds['descricao'].toString(),
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                                textAlign: TextAlign.left,
                              ),
                            ),

                            //Botão de ir para a página com mais detalhes
                            ButtonTheme(
                              minWidth: 5.0,
                              height: 50.0,
                              child: RaisedButton(
                                color: Color.fromRGBO(58, 66, 86, .9),
                                child: 

                                Padding(
                                  padding: EdgeInsets.symmetric(),
                                  child: Row(children: <Widget>[
                                  
                                  Text(
                                    "Ver mais",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),

                                  // Icon(Icons.call_received, color: Colors.white,),

                                  ]),
                                ),
                              

                                onPressed: () {
                                  //Ao pressionar, redirecionar para a página com os detalhes
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPageExtensao(
                                        this.user, 
                                        this._nomeFaculdade,
                                        ds["titulo"],
                                        ds["descricao"],
                                        ds["bolsa"],
                                        ds["nomeProfessor"],
                                        ds["areaProfessor"],
                                        ds["emailProfessor"])                   
                                        )
                                    );
                                }


                                
                              ),
                            )
                          ]),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        );
      }

  // void createRecord(){
  //   databaseReference.child("1").set({
  //     'title': 'Mastering EJB',
  //     'description': 'Programming Guide for J2EE'
  //   });
  //   databaseReference.child("2").set({
  //     'title': 'Flutter in Action',
  //     'description': 'Complete Programming Guide to learn Flutter'
  //   });
  // }

  //TESTE (Não utilizado) -----------------------------------------
  // - Cria um novo documento
  void createRecord() {
    Map<String, String> data = <String, String>{
      "name": "Pawan Kumar",
      "desc": "Flutter Developer"
    };
    projetosExtensao.document().setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  //Lê dados do banco
  void getData() {
    // databaseReference.once().then((DataSnapshot snapshot) {
    //   print('Data : ${snapshot.value}');
    // });
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  //Inicialização. Depois inicializar com lista de contas atual
  @override
  void initState() {
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        //Colocar Listview?
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  //Verificar se a função vai ficar no app
  void updateData() {
    // databaseReference.child('1').update({
    //   'description': 'J2EE complete Reference'
    // });
  }

  //Função pra deletar, talvez usar quando a conta for paga
  void deleteData() {
    // databaseReference.child('1').remove();
  }

  void deleta() async {
    await Firestore.instance
        .collection("alunos")
        .document(user.usuario.uid)
        .collection("projetosExtensao")
        .document()
        .delete();
  }
    
    Future _selectDate() async {
    var picked = await showDatePicker(
      context: context,
      initialDate: now,
      lastDate: new DateTime(2050),
      firstDate: new DateTime(2017),
    );

    if (picked != null)
      setState(() {
        selecionado = picked;
        data = selecionado.day.toString() +
            "/" +
            selecionado.month.toString() +
            "/" +
            selecionado.year.toString();
      });
  }

  //void setState(Null Function() param0) {}
}