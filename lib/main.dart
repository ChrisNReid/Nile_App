import 'package:flutter/material.dart';
import 'package:nile_app/models/user.dart';
import 'package:nile_app/services/authSErv.dart';
import 'package:nile_app/wrapper.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthServ().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
