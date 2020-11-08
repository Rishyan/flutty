import 'package:flutter/material.dart';
import 'package:flutty/screens/authenticate/authenticate.dart';
import 'package:flutty/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutty/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    print(user);
    // retourne soit le menu principal ou le widget d'authentification.
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
