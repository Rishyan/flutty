import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutty/models/user.dart';
import 'package:flutty/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // user objet depuis FirebaseUser
  User _userDeFirebase(FirebaseUser user) {
    if (user != null) {
      return User(uid: user.uid);
    } else {
      return null;
    }
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userDeFirebase);
  }

  // connexion anonyme
  Future signInAnonyme() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userDeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // connexion avec email
  Future connexionEmailetPsswd(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userDeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //s'inscrire avec email et mdp
  Future inscriptionEmailetPsswd(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document
      await DatabaseService(uid: user.uid).updateUserData('0', 'new', 100);
      return _userDeFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //deconnexion
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
