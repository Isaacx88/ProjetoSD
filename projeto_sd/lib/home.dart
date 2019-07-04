import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projeto_sd/projetosPage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Aluno.dart';
import 'adicionarProjeto.dart';
// import 'package:galinha_manca/UI/chart_tab.dart';
// import 'package:galinha_manca/UI/extrato_tab.dart';
// import 'package:galinha_manca/helpers/Aluno.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:galinha_manca/UI/geral_tab.dart';
// import 'package:galinha_manca/UI/contas.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/gestures.dart';
//import 'package:galinha_manca/helpers/createMaterialColor.dart';
//import 'package:galinha_manca/helpers/dataClasses.dart';
//MUITOS ICONES!!! https://materialdesignicons.com/
//import 'package:galinha_manca/UI/contas_tab.dart';
//import 'package:firebase_auth/firebase_auth.dart';
// import 'package:galinha_manca/UI/categorias_lista.dart';
// import 'sobre.dart';

class HomeScreen extends StatefulWidget {
  Aluno user;
  String _nomeFaculdade;
  HomeScreen(this.user, {Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState(user, _nomeFaculdade);
}

class _HomeScreenState extends State<HomeScreen> {
  Aluno user;

  // Widget _tabSelected;
  // int _tabSelectedIndex = 0;
  // List<Widget> _tabsWidget;

  _HomeScreenState(this.user, this._nomeFaculdade);

  // _HomeScreenState(this.user) {
  //   _tabSelected = GeralTab(user);
  //   _tabsWidget = <Widget>[GeralTab(user), ExtratoTabPage(user), Contas(user)];
  // }

  // void _changeTab(int index) {
  //   setState(() {
  //     _tabSelectedIndex = index;
  //   });
  // }

//Teste combo box
  List _faculdades = ["FACEEL", "FAMAT", "FAEC", "FEMMA", "FAQUIM", "FAGEO", "FEMAT"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _nomeFaculdade;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _nomeFaculdade = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    for (String faculdade in _faculdades) {
      items.add(new DropdownMenuItem(
          value: faculdade,
          child: new Text(faculdade)
      )
      );
    }
    return items;
  }




  void changedDropDownItem(String selectedfaculdade) {
    setState(() {
      _nomeFaculdade = selectedfaculdade;
    });
  }

  //CollectionReference emails;
  // CollectionReference emails;
  // DocumentReference documentReference;


  //   documentReference.get().then((datasnapshot) {
  //     if (datasnapshot.exists) {
  //       setState(() {
  //         String myText = datasnapshot.data['desc'];
  //       });
  //     }
  //   }
  //List<String> names = List.from(emails['names']);


  @override
  Widget build(BuildContext context) {

print("Faculdade selecionada: " + _nomeFaculdade);
        return Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountEmail: Text(this.user.getFirebaseUser().email),
                  accountName: Text(this.user.getFirebaseUser().displayName),
                  currentAccountPicture: new Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 1.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  this.user.getFirebaseUser().photoUrl)))),
                ),
                ListTile(
                  leading: Icon(Icons.library_add, size: 30,),
                  title: Text('Adicionar projeto', style: TextStyle(fontSize: 18), textAlign: TextAlign.left,),


                  onTap: () {
                    if(this.user.getFirebaseUser().email == "isaacbarros88@gmail.com" || this.user.getFirebaseUser().email == "fernando.freire.94@gmail.com"){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdicionarProjetosPage(this.user)));
                    } else{
                     return new Alert(
                        context: context,
                        type: AlertType.error,

                        title: "AVISO",
                        desc: "Você precisa de autorização para utilizar essa função.",
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
                    }

                  },
                )
              ],
            ),
          ),

      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "Projetos | Unifesspa",
          style: TextStyle(color: Colors.white),
        ),


        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () => {
              //Página do about

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ModalSobre()))
            },
          ),
        ],
      ),
      //Corpo das Tabs
      body: Center(
        
        child: Column(children: <Widget>[

          Container(
            // color: Colors.white,
            padding: EdgeInsets.fromLTRB(00, 0, 10, 0),
            height: 200,
            width: MediaQuery.of(context).size.width - 70,
            decoration: new BoxDecoration(
              image: new DecorationImage(
              
//                image: new AssetImage("images/projetosUNIFESSPA_LOGO.PNG"), //imagem titulo epitelização
                image: new AssetImage("images/teste2.png"), //imagem titulo epitelização

                fit: BoxFit.contain,
              ),
            )
            ),


          Container(
            child: Text("Escolha a sua faculdade:", style: TextStyle(fontSize: 25),),
          ),

          Divider(height: 20, color: Colors.transparent,),

          new DropdownButton(       
            value: _nomeFaculdade,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            
          ),

          ButtonTheme(
            minWidth: 150.0,
            height: 40.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    
                    MaterialPageRoute(
                    //Passa o nome da faculdade como atributo
                    builder: (BuildContext contex) => ProjetosPage(_nomeFaculdade, user,)
                    )
                );

              },
              child: Text("Continuar", style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),





        ],),
        )
      
      //Inserir selection box de faculdades


      // bottomNavigationBar: BottomNavigationBar(
      //   iconSize: 35,
      //   selectedFontSize: 17,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: Theme.of(context).primaryColor,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(MdiIcons.cashUsd),
      //       title: Text('Geral'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(MdiIcons.bankTransfer),
      //       title: Text('Extrato'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(MdiIcons.noteText),
      //       title: Text('Contas'),
      //     )
      //   ],
      //   currentIndex: _tabSelectedIndex,
      //   onTap: _changeTab,
      // ),
    );
    
  }
}
