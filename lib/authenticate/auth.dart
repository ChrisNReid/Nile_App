import 'package:flutter/material.dart';
import 'package:nile_app/login_screen.dart';
import 'package:nile_app/signup_page.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LoginScreen(),
    );
  }
}
