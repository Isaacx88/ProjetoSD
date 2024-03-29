import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'package:galinha_manca/helpers/Aluno.dart';
//import 'package:intl/intl.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Aluno.dart';

//import 'package:intl/intl.dart';

//import 'package:sandbox/Categoria.dart';

// class DetailPageExtensao extends StatelessWidget {
//  //Cria novos documentos se o nome do caminho for diferente
//  final DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).document("myData/dummy2");
// DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).document("projetosExtensao/contaR1");
//DocumentReference documentReference = Firestore.instance           .collection("alunos")           .document(user.usuario.uid).collection("projetosExtensao").document("contaR1");
//  String myText = "Teste";
//  StreamSubscription<DocumentSnapshot> subscription;
//   //final databaseReference = FirebaseDatabase.instance.reference();

class DetailPageExtensao extends StatefulWidget {
  Aluno user;
  double aux;
  String _nomeFaculdade;
  String titulo;
  String descricao;
  bool bolsa;
  String professorNome;
  String professorArea;
  String profContato;

  DetailPageExtensao(this.user, this._nomeFaculdade, this.titulo, 
  this.descricao, this.bolsa, this.professorNome, this.professorArea, this.profContato);



  @override
  DetailPageExtensaoState createState() {
    return new DetailPageExtensaoState(this.user, this._nomeFaculdade, this.titulo, this.descricao, this.bolsa, this.professorNome, this.professorArea, this.profContato);
  }
}
//Adaptar para exibir apenas a conta do usuário

class DetailPageExtensaoState extends State<DetailPageExtensao> {
  Aluno user;
  String _nomeFaculdade;
  String titulo;
  String descricao;
  bool bolsa;
  String professorNome;
  String professorArea;
  String profContato;
  
  DetailPageExtensaoState(this.user, this._nomeFaculdade, this.titulo, 
  this.descricao, this.bolsa, this.professorNome, this.professorArea, this.profContato) {
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
  //String descricao = "";
  String devedor = "";
  double valor = 0;
  double aux;

  //String id = snapshot.documentID;

  // DetailPageExtensao.fromDocument(DocumentSnapshot snapshot) {
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
                       final Email email = Email(
                        body: 'Olá! Estou interessado em participar do seu projeto!',
                        subject: 'Intenção de participação em projeto - UNIFESSPA',
                        //Inserir email do professor (this.profContato)
                        recipients: [this.profContato],
                        // recipients: ['professor@example.com'],
                        // cc: ['cc@example.com'],
                        // bcc: ['bcc@example.com'],
                        //attachmentPath: '/path/to/attachment.zip',
                      );
  




    return Scaffold(
      body: SingleChildScrollView(
        child: 
      
      Column(
        children: <Widget>[
          Stack(
      children: <Widget>[
        

        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          padding: EdgeInsets.fromLTRB(35, 20, 0, 0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 35.0),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                    Icons.description,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  ),
                  
                  Container(
                    width: 60.0,
                    // child: new Divider(color: Colors.green),
                    child: new Divider(color: Colors.white),

                  ),
                  SizedBox(height: 10.0),
                  
                  
                  Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.2,
                  padding: EdgeInsets.fromLTRB(5, 0, 30, 0),
                  child: 
                  Text(
                    titulo,
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                    // textAlign: TextAlign.left,
                    textAlign: TextAlign.center,
                  ),
                  ),
                  
                  SizedBox(height: 2.0),
         
                ],
              ),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    ), 
    
    
    Container(
      width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.all(40.0),
      padding: EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          children: <Widget>[

            Text(
              descricao,          
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),

            Divider(
              height: 20,
            ),


            Container(
              alignment: Alignment.centerLeft,
              child: Text(
              "Nome do professor: ",          
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
              ),
            ),
            
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
              professorNome+"\n",          
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
              ),
            ),
            
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
              "Área de atuação: ",          
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
              professorArea,          
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
              ),
            ),

            Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () async => {


                      await FlutterEmailSender.send(email)
                  },
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                  child:
                      Text("Enviar email para o professor responsável", style: TextStyle(color: Colors.white)),
                )
            )
        ]
        ),
      ),
    )],
      ),
      
      )
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
