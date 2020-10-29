import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Screens/HomeScreen.dart';
import 'package:market/Screens/MainScreen.dart';
import 'package:market/Widgets/Loading.dart';
import 'package:provider/provider.dart';

import 'SignupScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : Center(
              child: Form(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius:
                                        5.0, // has the effect of softening the shadow
                                    spreadRadius:
                                        0.5, // has the effect of extending the shadow
                                    offset: Offset(
                                      0.0, // horizontal, move right
                                      0.0, // vertical, move down
                                    ),
                                  )
                                ],
                              ),
                              child: Image.asset(
                                'images/noimage.png',
                                height: 100,
                                width: 100,
                              )),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        TextFormField(
                            controller: authProvider.email,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: "email",
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            controller: authProvider.password,
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: "Password",
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text('Login',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                            onPressed: () async {
                              if (!await authProvider.signIn()) {
                                _key.currentState.showSnackBar(
                                    SnackBar(content: Text("Login failed")));
                                return;
                              } else {
                                authProvider.clearControllers();
                                changeScreenReplacement(context, MainScreen());
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: FlatButton(
                            onPressed: () {},
                            hoverColor: Colors.teal,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Text("Forgot password?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      )),
                                  SizedBox(width: 5),
                                  Text(
                                    "Reset",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignUpScreen()));
                            },
                            hoverColor: Colors.teal,
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Text("Don\'t have an account?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      )),
                                  SizedBox(width: 5),
                                  Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
