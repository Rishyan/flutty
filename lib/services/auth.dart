import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutty/models/user.dart';

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

  //s'inscrire avec email et mdp

  //deconnexion
}
