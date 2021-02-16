import 'package:dear_diary/ui/client_home_page/home_page_provider.dart';
import 'package:dear_diary/ui/client_home_page/home_page_view.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/util/assets.dart';
import 'package:dear_diary/widgets/SigninForm.dart';
import 'package:dear_diary/widgets/SignupForm.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginView> {
  bool isLoginPage = true;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String name;
  String email;
  String password;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var un = TextEditingController();
    var ps = TextEditingController();
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

    return Container(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.LOGO_IMAGE,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        "Dear Diary",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),
              ),
            ),
            Center(
                child: isLoginPage
                    ? Form(
                        key: _formKey,
                        child: Card(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
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
                                          'Sign In',
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
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: un,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your email';
                                        } else if (EmailValidator.validate(
                                            value)) {
                                          name = value;
                                        } else {
                                          return 'Please enter a valid Email';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Your email',
                                          hintText: 'Your email'),
                                    ),
                                  ),

                                  //password field
                                  Padding(
                                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
                                    child: TextFormField(
                                      autofocus: false,
                                      controller: ps,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter your password.';
                                        } else {
                                          password = value;
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Password',
                                          hintText: 'Password'),
                                      obscureText: true,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 20.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.blue,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        // otherwise.
                                        if (_formKey.currentState.validate()) {
                                          LoginBloc(context)
                                              .add(SigninEvent(name, password));
                                          // Future.microtask(() => Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             HomeProvider(name: name))));
                                        }
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Login",
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
                      )
                    : Form(
                        key: _formKey2,
                        child: Card(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 10.0, right: 10.0),
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
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
                                    child: userNameField,
                                  ),
                                  Padding(
                                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
                                    child: emailField,
                                  ),
                                  Padding(
                                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
                                    child: passwordField,
                                  ),
                                  Padding(
                                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        right: 10,
                                        left: 10,
                                        bottom: 10),
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
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        // otherwise.
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                      )),
            Center(
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (isLoginPage == true) {
                      isLoginPage = false;
                    } else {
                      isLoginPage = true;
                    }
                  });
                },
                child: Text(
                  isLoginPage
                      ? "Don't have an account? Register now"
                      : "Already have an account? Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
