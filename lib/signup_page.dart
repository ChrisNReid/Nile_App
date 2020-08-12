import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nile_app/services/authSErv.dart';
import 'constants.dart';

class Signup extends StatefulWidget {
  static String get fullName => fullName;

  @override
  _SignupState createState() => _SignupState();

  static String getfullName() {
    return fullName;
  }
}

class _SignupState extends State<Signup> {
  final AuthServ _auth = AuthServ();
  final _formKey = GlobalKey<FormState>();

  bool _rememberMe = false;
  String fullName = '';
  String email = '';
  String password = '';
  String confPassword = '';
  String error = '';
  bool loading = false;

  // Widget build(BuildContext content) {
  //return Stack(
//alignment: Alignment.topLeft,
  //   children: <Widget>[
  //YourScrollViewWidget(),
  //   IconButton(
  //     icon: Icon(Icons.arrow_back),
  //     onPressed: () {
//Navigator.pop(context);
//},
  // )

  //SizedBox(height: 14.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account info'),
        backgroundColor: Color(0xFF004D40),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context, true);
            }),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        automaticallyImplyLeading: true,
        //`true` if you want Flutter to automatically add Back Button when needed,
        //or `false` if you want to force your own back button every where
        //leading: IconButton(
        // icon: Icon(Icons.arrow_back),
        //onPressed:() => Navigator.pop(context, false),
        // onPressed: () => LoginScreen(),
      ),
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
                    vertical: 50.0,
                    //         horizontal: 150.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        'Sign Up',
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
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 200.0),
                        TextFormField(
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Full Name'),
                          validator: (val) => val.isEmpty ? 'enter name' : null,
                          onChanged: (val) {
                            setState(() => fullName = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'enter email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Password'),
                          obscureText: true,
                          validator: (val) => val.length < 8
                              ? 'Enter a valid password (8+ charcaters long)'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: kInputDecoration.copyWith(
                              hintText: 'Confirm Password'),
                          obscureText: true,
                          validator: (val) => password != confPassword
                              ? 'passwords dont match '
                              : null,
                          onChanged: (val) {
                            setState(() => confPassword = val);
                          },
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 20.0,
                          child: Row(
                            children: <Widget>[
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: Colors.white),
                                child: Checkbox(
                                  value: _rememberMe,
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: kLabelStyle,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Text(error,
                            style:
                                TextStyle(color: Colors.red, fontSize: 14.0)),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            //padding: EdgeInsets.all(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.white,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Color(0xFF527DAA),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            onPressed: () => () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth.regEmailPass(
                                    fullName, email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'not valid';
                                  });
                                }
                              }
                            },
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
