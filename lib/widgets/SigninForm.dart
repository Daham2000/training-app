import 'dart:math';

import 'package:dear_diary/ui/client_home_page/home_page.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/util/routes.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String name;
  String password;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    // final rootBloc = BlocProvider.of<LoginBloc>(context);
    var un = TextEditingController();
    var ps = TextEditingController();
    return Form(
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
                  padding:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
                  child: TextFormField(
                    autofocus: false,
                    controller: un,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      } else if (EmailValidator.validate(value)) {
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
                  padding:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 10),
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
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: () async {
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        LoginBloc(context).add(SigninEvent(name, password));
                        // Future.microtask(() => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             HomeProvider(name: name))));
                      }
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
