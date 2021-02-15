import 'dart:async';

import 'package:dear_diary/ui/client_home_page/home_page.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _signUpFormState createState() => _signUpFormState();
}

class _signUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String email;
  String password;
  bool _agreedToterms = false;

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToterms = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    var nm = TextEditingController();
    var em = TextEditingController();
    var pa = TextEditingController();
    var pac = TextEditingController();

    final userNameField = TextFormField(
      autofocus: false,
      controller: nm,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a user name';
        } else {
          name = value;
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Your username',
          hintText: 'Your username'),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: em,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your email';
        } else if (EmailValidator.validate(value)) {
          email = value;
        } else {
          return 'Please enter a valid Email';
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: 'Email', hintText: 'Email'),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: pa,
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please input a password';
        } else if (value.length < 6) {
          return 'Please input at least 6 characters';
        } else {
          password = value;
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Password'),
    );

    final passwordFieldConfirm = TextFormField(
      autofocus: false,
      controller: pac,
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please input a password';
        } else if (value.length < 6) {
          return 'Please input at least 6 characters';
        } else {
          // ignore: unrelated_type_equality_checks
          if (pa.value != value) {
            return "Password doesn't match";
          }
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password confirm',
          hintText: 'Password confirm'),
    );

    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: _formKey,
          child: Card(
            margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 0.0, bottom: 30.0),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      child: userNameField,
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      child: emailField,
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      child: passwordField,
                    ),
                    Padding(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      child: passwordFieldConfirm,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        onPressed: () async {
                          // otherwise.
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Register",
                                  style: TextStyle(
                                      // color: Colors.white,
                                      fontSize: 18.0)),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_right_alt_rounded,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
