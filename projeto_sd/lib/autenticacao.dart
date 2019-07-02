// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Authentication {

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = new GoogleSignIn();

//   Future<FirebaseUser> signInWithGoogle() async {

//     // Vai tentar pegar o usuario atual autenticado
//     GoogleSignInAccount currentUser = _googleSignIn.currentUser;

//     var isSigned = await _googleSignIn.isSignedIn();

//     if(currentUser == null && isSigned == true){
//       //Vai tentar logar sem interagir com o usuário
//       currentUser = await _googleSignIn.signInSilently();
//     }
    
//     if(currentUser == null){
//       //Exige a interação do usuário para logar
//       currentUser = await _googleSignIn.signIn().catchError((onError) => print("Erro " + onError.toString()));
//     }

//     if(currentUser == null){
//       print("Erro, google sign nao funciona");
//     }

//     final GoogleSignInAuthentication auth = await currentUser.authentication;

//     //Autenticar com firebase
//     final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: auth.idToken, accessToken: null);
//     final FirebaseUser user = await _auth.signInWithCredential(credential);

//     print("Logado como: " + user.displayName);

//     assert(user != null);
//     assert(!user.isAnonymous);

//     return user;

//   }

//   Future<Null> signOutWithGoogle() async {
//     //Deslogar com o firebase
//     await _auth.signOut();
//     //Deslogar com o google
//     await _googleSignIn.signOut();
//   }

// }