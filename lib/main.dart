import 'package:flutter/material.dart';
import 'package:flutty/screens/wrapper.dart';
import 'package:flutty/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutty/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
