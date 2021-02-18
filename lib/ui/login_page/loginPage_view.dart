import 'package:dear_diary/theme/style_color.dart';
import 'package:dear_diary/ui/client_home_page/home_page_provider.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/util/assets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fcode_common/fcode_common.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginView> {
  bool isLoginPage = true;
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String error;
  String info;

  String name;
  String email;
  String password;
  CustomSnackBar _customSnackBar;

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
    var userNameCtrl = TextEditingController();
    var passCtrl = TextEditingController();
    var emailCtrl = TextEditingController();
    var passConfirmCtrl = TextEditingController();
    bool isLoading = false;

    final loginBloc = BlocProvider.of<LoginBloc>(context);

    _customSnackBar = CustomSnackBar(scaffoldKey: scaffoldKey);

    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameCtrl,
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
      controller: emailCtrl,
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
      controller: passCtrl,
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
      controller: passConfirmCtrl,
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please input a password';
        } else if (value.length < 6) {
          return 'Please input at least 6 characters';
        } else {
          // ignore: unrelated_type_equality_checks
          if (passCtrl.text != value) {
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

    void _loginClicked() {
      _customSnackBar.showLoadingSnackBar(
          backgroundColor: StyleColors.LIGHT_BLUE);
      final email = (emailCtrl.text ?? "").trim();
      final password = (passCtrl.text ?? "").trim();
      if (EmailValidator.validate(email)) {
        loginBloc.add(SigninEvent(email, password));
      } else {
        _customSnackBar.showErrorSnackBar("Email or Password is Empty!");
        return;
      }
      if (email.isEmpty || password.isEmpty) {
        _customSnackBar.showErrorSnackBar("Email or Password is Empty!");
        return;
      }
    }

    void _registerClicked() {
      final email = (emailCtrl.text ?? "").trim();
      final password = (passCtrl.text ?? "").trim();
      if (email.isEmpty || password.isEmpty) {
        _customSnackBar.showErrorSnackBar("Email or Password is Empty!");
        return;
      }
      loginBloc.add(SignUpEvent(email, password));
      setState(() {
        isLoginPage = !isLoginPage;
      });
    }

    final scaffold = Scaffold(
      backgroundColor: Colors.blueAccent,
      body: info != null
          ? AlertDialog(
              title: Text(''),
              content: Text("${info}"),
              actions: <Widget>[
                TextButton(
                  child: Text('Close'),
                  onPressed: () {
                    setState(() {
                      info = null;
                    });
                  },
                ),
              ],
            )
          : Column(
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
                                              top: 5.0,
                                              left: 0.0,
                                              bottom: 30.0),
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

                                      // emailField
                                      Padding(
                                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              right: 10,
                                              left: 10,
                                              bottom: 10),
                                          child: emailField),

                                      //password field
                                      Padding(
                                          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                                          padding: EdgeInsets.only(
                                              top: 10,
                                              right: 10,
                                              left: 10,
                                              bottom: 10),
                                          child: passwordField),

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
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              _loginClicked();
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
                                                Icon(
                                                    Icons
                                                        .arrow_right_alt_rounded,
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
                                              top: 5.0,
                                              left: 0.0,
                                              bottom: 30.0),
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
                                          onPressed: () {
                                            if (_formKey2.currentState
                                                .validate()) {
                                              _registerClicked();
                                            }
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
                                                Icon(
                                                    Icons
                                                        .arrow_right_alt_rounded,
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
    );

    return MultiBlocListener(
        listeners: [
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (pre, current) => pre.error != current.error,
            listener: (context, state) {
              if (state.error.isNotEmpty) {
                setState(() {
                  info = state.error;
                });
              }
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (pre, current) =>
                (pre.email != current.email && current.email.isNotEmpty) ||
                (pre.userId != current.userId && current.userId.isNotEmpty),
            listener: (context, state) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeProvider(name: state.email)));
            },
          ),
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (pre, current) =>
                pre.isUserSignUpd != current.isUserSignUpd,
            listener: (context, state) {
              setState(() {
                isLoginPage = true;
                info = "Registration success";
              });
            },
          )
        ],
        child: WillPopScope(
          child: scaffold,
        ));
  }
}
