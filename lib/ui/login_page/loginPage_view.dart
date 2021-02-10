import 'package:dear_diary/ui/client_home_page/home_page.dart';
import 'package:dear_diary/ui/client_home_page/home_page_bloc.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/util/routes.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../client_home_page/home_page_view.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String randomName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 200.0, left: 110.0),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/FF.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 240.0, left: 10.0),
                      child: Center(
                          child: Text(
                        "Dear Diary",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      )),
                    )
                  ],
                ),
                Form(
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
                                    top: 0.0, left: 10.0, bottom: 30.0),
                                width: 350,
                                height: 100,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 2.0),
                              child: TextFormField(
                                autofocus: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter a nick name';
                                  } else {
                                    name = value;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Your Nickname',
                                    hintText: 'Your nickname'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 0.0, bottom: 10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('RANDOM'),
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

                                    Future.microtask(
                                      () => Navigator.pushReplacementNamed(
                                          context, Routes.HOME_ROUTE),
                                    );
                                  }
                                },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text("CONTINUE",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
