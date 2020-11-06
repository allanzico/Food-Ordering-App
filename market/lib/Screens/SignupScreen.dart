import 'package:flutter/material.dart';
import 'package:market/Helpers/ScreenNavigation.dart';
import 'package:market/Providers/UserProvider.dart';
import 'package:market/Screens/MainScreen.dart';
import 'package:provider/provider.dart';

import 'SigninScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "";
  String password = "";
  String firstName = "";
  String lastName = "";
  String error = "";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();
    final authProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: Center(
        child: Form(
          key: _formKey,
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
                    controller: authProvider.firstName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "First name",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide.none)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'First name is required';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        firstName = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: authProvider.lastName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Last name",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide.none)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Last name is required';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        lastName = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "email",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide.none)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: authProvider.password,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide.none)),
                    validator: (value) {
                      if (value.length < 6) {
                        return 'Enter a password with 6+ chars';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
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
                      child: Text('Signup',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result = await authProvider
                              .registerWithEmailAndPassword(email, password);
                          changeScreenReplacement(context, MainScreen());
                          if (result == null) {
                            setState(() {
                              error = "FAILED>>>>>";
                            });
                          }
                        }

                        // if (!await authProvider.signUp()) {
                        //   _key.currentState.showSnackBar(
                        //       SnackBar(content: Text("Signup failed")));

                        //   return;
                        // } else {
                        //   authProvider.clearControllers();
                        //   changeScreenReplacement(context, MainScreen());
                        // }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => SignInScreen()));
                      },
                      hoverColor: Colors.teal,
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Text("Got an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                )),
                            SizedBox(width: 5),
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
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
