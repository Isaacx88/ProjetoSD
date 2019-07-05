import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_sd/Aluno.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'home.dart';
import 'projetosPesquisa.dart';


class AdicionarProjetosPage extends StatefulWidget {
  Aluno user;
  AdicionarProjetosPage(this.user);

  @override
  State<StatefulWidget> createState() {
    return _AdicionarProjetosPageState(this.user);
  }
}

class _AdicionarProjetosPageState extends State<AdicionarProjetosPage> {
  Aluno user;
  //String _nomeFaculdade;
  _AdicionarProjetosPageState(this.user);
  
  //TiposFaculdades* 
  List _tiposProjetos = ["FACEEL", "FAMAT", "FAEC", "FEMMA", "FAQUIM", "FAGEO", "FEMAT"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _nomeFaculdade;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _nomeFaculdade = _dropDownMenuItems[0].value;
    selectedRadio = 1;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    for (String projeto in _tiposProjetos) {
      items.add(new DropdownMenuItem(
          value: projeto,
          child: new Text(projeto)
      )
      );
    }
    return items;
  }




  void changedDropDownItem(String selectedprojeto) {
    setState(() {
      _nomeFaculdade = selectedprojeto;
    });
  }


  //------
  int selectedRadio;
 
// @override
// void initState() {
//   super.initState();
//   selectedRadio = 1;
// }
 
// Changes the selected value on 'onChanged' click on each radio button
setSelectedRadio(int val) {
  setState(() {
    selectedRadio = val;
  });
}




  static final _formKey = GlobalKey<FormState>();
      //Evento para sair do app
    Future<bool> _onBackPressed(){
             Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen(user)));     
  }
  
  //Key para utilizar a função acima
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {




  final descController = TextEditingController();
  final nomeProfController = TextEditingController();
  final areaController = TextEditingController();
  final contatoProfController = TextEditingController();
  final tituloController = TextEditingController();
  int groupValue;

// Declare this variable

  return WillPopScope(
    onWillPop: _onBackPressed,
    key: _scaffoldKey,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Adicionar projeto",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                //Tipo de projeto
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "Tipo de projeto: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),


                        ],)
                        

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: Row(children: <Widget>[
                          Text("Pesquisa"),                  
                          Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            activeColor: Colors.black,
                            onChanged: (val) {
                              print("Radio $val");
                              setSelectedRadio(val);
                            },
                          ),
                        VerticalDivider(),
                        Text("Extensão"),   
                          Radio(
                            value: 2,
                            groupValue: selectedRadio,
                            activeColor: Colors.black,
                            onChanged: (val) {
                              print("Radio $val");
                              setSelectedRadio(val);
                            },
                          ),

                                                  
                        ]
                      ,)


                      )
                    ],
                  ),
                ),
                
                //Card de título
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "Título: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),


                        ],)
                        

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: TextField(
                          controller: tituloController,
                          decoration: InputDecoration(
                              hintText: "Adicione um título"),
                        ),
                      )
                    ],
                  ),
                ),

                // Card de descrição
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "Descrição: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ], 
                    )
                  ),
                    
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: TextField(
                          controller: descController,
                          decoration: InputDecoration(
                              hintText: "Adicione uma Descrição"),
                        ),
                      )
                    ],
                  ),
                ),
             
                //Campo de Nome
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "Nome do professor: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),


                        ],)
                        

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: TextField(
                          controller: nomeProfController,
                          decoration: InputDecoration(
                              hintText: "Adicione o nome do professor"),
                        ),
                      )
                    ],
                  ),
                ),

                //Campo de area de atuação
                 Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "Área de atuação: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),


                        ],)
                        

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: TextField(
                          controller: areaController,
                          decoration: InputDecoration(
                              hintText: "Adicione a área de atuação"),
                        ),
                      )
                    ],
                  ),
                ),

                //Campo de contato
                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "E-mail do professor: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),


                        ],)
                        

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: TextField(
                          controller: contatoProfController,
                          decoration: InputDecoration(
                              hintText: "Adicione o e-mail do professor"),
                        ),
                      )
                    ],
                  ),
                ),

                Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(children: <Widget>[
                        
                        Text(
                          "Faculdade: ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),


                        ],)
                        

                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                        child: new DropdownButton(       
                              value: _nomeFaculdade,
                              items: _dropDownMenuItems,
                              onChanged: changedDropDownItem,            
                            ),
                      )
                    ],
                  ),
                ),


                Divider(),
                // Linha com os botões
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      child: Text("Cancelar",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => {Navigator.pop(context)},
                    ),
                    VerticalDivider(),
                    RaisedButton(
                      color: Colors.green,
                      child: Text(
                        "Adicionar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {

                    Map<String, String> dados = <String, String>{
                      "titulo": tituloController.text,
                      "descricao": descController.text,
                      "nomeProfessor": nomeProfController.text,
                      "areaProfessor": areaController.text,
                      "emailProfessor": contatoProfController.text
                    };

                    //Verifica se as entradas de texto estão vazias
                    //Se estiver vazio, abre o popup de alerta

                    if (tituloController.text == "" ||
                       descController.text == "" ||
                        nomeProfController.text == "" ||
                        areaController.text == "" ||
                        contatoProfController.text == ""
                        ) {

                      // print("Descrição: " + descController.text);
                      // print("Devedor: " + devedorController.text);
                      // print("Valor: " + _valorController.text);
  
                      return new Alert(
                        context: context,
                        type: AlertType.error,
                        title: "AVISO",
                        desc: "Verifique se os campos foram preenchidos corretamente!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                    } else {

                      //if pesquisa
                      if(selectedRadio == 1){
                        
                        CollectionReference projetosPesquisa;

                        projetosPesquisa = Firestore.instance
                        .collection("faculdades")
                        .document(_nomeFaculdade).collection("projetosPesquisa");

                        projetosPesquisa.document().setData(dados).whenComplete(() {
                        print("Projeto de pesquisa adicionado!");

                     new Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Sucesso!",
                        desc: "Projeto de pesquisa adicionado.",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();

                    }).catchError((e) => print(e));

                        
                        
 
                        
                        
                        //Navigator.pop(context);
                      }
                      
                      //if extensão
                      if(selectedRadio == 2){
                        
                        CollectionReference projetosPesquisa;

                        projetosPesquisa = Firestore.instance
                        .collection("faculdades")
                        .document(_nomeFaculdade).collection("projetosExtensao");

                        projetosPesquisa.document().setData(dados).whenComplete(() {
                        print("Projeto de extensão adicionado!");
                        }).catchError((e) => print(e));

                        Navigator.pop(context);
                      }                   

                      //Seta novamente os campos para ficar "em branco". Dispose não estava funcionando
                      tituloController.text = "";
                      descController.text = "";
                      nomeProfController.text = "";
                      areaController.text = "";
                      contatoProfController.text = "";


                      // descController.text = "";
                      // credorController.text = "";
                      // dataController.text = "";
                      // valorController.text = "";
                      // dispose();

                      

                      

                    }



                        //AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
                        // if (_formKey.currentState.validate())
                        //   {
                        //     setState(() {
                        //       var replaced =
                        //           _valorController.text.replaceAll(".", "");
                        //       replaced = replaced.replaceAll(",", ".");
                        //       aux = num.tryParse(replaced)?.toDouble()?.abs();
                        //       // if (this.saida) {
                        //       //   aux *= -1;
                        //       // }

                        //       // user.addDinheiro(aux,
                        //       //     categoria: categoria,
                        //       //     subcategoria: subcategoria,
                        //       //     data: selecionado,
                        //       //     descricao: descricao.text);
                        //     }),

                        //     _valorController.text = "",
                          //   Navigator.pop(context),
                          //   Navigator.pop(context),
                          //   Navigator.pop(context)
                          // }
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
    



    }
    
    
    