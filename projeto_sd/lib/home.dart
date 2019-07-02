import 'package:flutter/material.dart';

import 'Aluno.dart';
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
  HomeScreen(this.user, {Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState(user);
}

class _HomeScreenState extends State<HomeScreen> {
  Aluno user;

  Widget _tabSelected;
  int _tabSelectedIndex = 0;
  List<Widget> _tabsWidget;

  _HomeScreenState(this.user);

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
  List _cities =
  ["Cluj-Napoca", "Bucuresti", "Timisoara", "Brasov", "Constanta"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }




  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }







  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.white,
          /*drawer: Drawer(
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
                  leading: Icon(MdiIcons.formatListChecks),
                  title: Text('Categorias'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Categorias()));
                  },
                )
              ],
            ),
          ),*/

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

               new DropdownButton(
                 
                value: _currentCity,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              )





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
