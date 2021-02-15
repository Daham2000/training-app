import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:dear_diary/util/assets.dart';
import 'package:dear_diary/widgets/SigninForm.dart';
import 'package:dear_diary/widgets/SignupForm.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<LoginView> {
  bool isLoginPage = true;

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
    // final rootBloc = BlocProvider.of<LoginBloc>(context);

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
              child: isLoginPage ? SigninForm() : SignUpForm(),
            ),
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
