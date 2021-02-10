import 'package:dear_diary/main.dart';
import 'package:dear_diary/ui/client_home_page/home_page.dart';
import 'package:dear_diary/ui/client_home_page/home_page_bloc.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/util/routes.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:dear_diary/widgets/SigninForm.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget> [
          Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/FF.jpg',
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
              )
          ),
          Center(
            child: SigninForm(),
          )
        ],
      ),
    );
  }
}
