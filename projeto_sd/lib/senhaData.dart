import 'package:cloud_firestore/cloud_firestore.dart';

class SenhaData{
  String senha;

  SenhaData.fromDocument(DocumentSnapshot snapshot){
    senha = snapshot.data["senha"];

  }
}