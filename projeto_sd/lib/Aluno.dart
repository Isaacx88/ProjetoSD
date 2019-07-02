import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Aluno {
  final FirebaseUser usuario;
  var firebasePATH = Firestore.instance.collection("alunos");

  Aluno(this.usuario) {
    userExists();
  }

  userExists() {
    //Verifica se existe o documento
    this.firebasePATH.document(usuario.uid).get().then((docSnap) => {
          if (!docSnap.exists)
            {
              //Caso não exista ele vai criar um com informações basicas
              firebasePATH
                  .document(usuario.uid)
                  .setData({"nome": usuario.displayName, "faculdade": "UNIFESSPA", "discente": true}),
            }
        });
  }

  // Mexe com o dinheiro do usuario
  // Caso não passado o nome da categoria, sera computado como outro
  void addDinheiro(double valor,
      {String categoria = "Outro",
      String subcategoria = "Outro",
      String descricao = "",
      DateTime data}) {
    //Pega a data atual
    var now;
    if(data == null){
      now = DateTime.now();
    }else{
      now = data;
    }

    //Altera o saldo global do usuario
    firebasePATH.document(usuario.uid).get().then((docSnap) => {
          firebasePATH
              .document(usuario.uid)
              .updateData({"saldo": docSnap["saldo"] + valor}),
        });

    //Cria um localPATH para o firebase para facilitar a vida
    var localPATH = this
        .firebasePATH
        .document(usuario.uid)
        .collection("entradas_saidas");

    var tipo = (valor < 0) ? "SAIDA" : "ENTRADA";

    localPATH.document().setData(
      {"valor": valor, "descricao": descricao,"categoria":categoria,"sub_categoria":subcategoria, "tipo": tipo, "data": now});
  }

  double getSaldo() {
    double saldo;
    firebasePATH.document(usuario.uid).get().then((docSnap) => {
          saldo = docSnap["saldo"],
        });

    return saldo;
  }

  //Getter e Setters
  FirebaseUser getFirebaseUser() {
    return this.usuario;
  }
}
