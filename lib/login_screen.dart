import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_app/home_page.dart';
import 'constants.dart';
import 'loading.dart';
import 'signup_page.dart';
import 'package:nile_app/signup_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  String fullName = '';
  bool _rememberMe = false;

  Future navigateToHomePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future navigateToSignupPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF004D40),
                            Color(0xFF00796B),
                            Color(0xFFB2DFDB),
                            Color(0xFFE0F2F1),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          vertical: 120.0,
                          //         horizontal: 150.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              'Nile',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 100.0),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 300.0),

                              TextFormField(
                                decoration: kInputDecoration.copyWith(
                                    hintText: 'Email'),
                                style: kHintTextStyle,
                                validator: (val) => val.isEmpty
                                    ? 'Enter an  valid email'
                                    : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                              SizedBox(height: 20.0),

                              TextFormField(
                                decoration: kInputDecoration.copyWith(
                                    hintText: 'Password'),
                                obscureText: true,
                                style: kHintTextStyle,
                                validator: (val) => val.length < 6
                                    ? 'Enter a valid password (6+ charcaters long)'
                                    : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              //login Button
                              SizedBox(height: 20.0),
                              Container(
                                width: double.infinity,
                                child: RaisedButton(
                                    elevation: 5.0,
                                    padding: EdgeInsets.all(15.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    color: Colors.white,
                                    child: Text(
                                      'LOG IN',
                                      style: TextStyle(
                                        color: Color(0xFF527DAA),
                                        letterSpacing: 1.5,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        //dynamic result = await _auth
                                        //   .signInEmailPass(email, password);
                                        //if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error =
                                              'Could not sign in with those credentials';
                                        });
                                        // }
                                      }
                                    }),
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),

                              new GestureDetector(
                                onTap: () {
                                  navigateToSignupPage(context);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Don\'t have an Account? ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
