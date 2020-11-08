import 'package:flutter/material.dart';
import 'package:flutty/screens/authenticate/authenticate.dart';
import 'package:flutty/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // retourne soit le menu principal ou le widget d'authentification.
    return Authenticate();
  }
}
