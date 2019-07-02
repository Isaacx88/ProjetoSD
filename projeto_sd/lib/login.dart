// import "package:flutter/material.dart";
// import 'package:galinha_manca/UI/home.dart';
// import 'helpers/authentication.dart';
// import 'package:galinha_manca/helpers/agricultor.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({Key key}) : super(key: key);

//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final Authentication auth = Authentication();

//   @override
//   void initState() {
//     super.initState();
//     new Future.delayed(Duration(seconds: 1)).then((onValue) => {
//           auth.signInWithGoogle().then((user) {
//             Agricultor agri = new Agricultor(user);
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) => HomeScreen(agri)));
//           })
//         });
//   }

//   String status = "Login";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               CircularProgressIndicator(
//                 backgroundColor: Colors.white,
//               ),
//               SizedBox(
//                 width: 20.0,
//               ),
//               Text(
//                 "Fazendo Loggin",
//                 style:
//                     TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
