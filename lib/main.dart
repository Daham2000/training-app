import 'views//second_screen.dart';
import "package:flutter/material.dart";
import 'views/root_page/loginPage.dart';
import 'views/form_screen.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dear Diary",
      home: Loginpage(),
      routes: <String, WidgetBuilder>{
        "/second" : (context) => FormTest(),
      },
    );
  }
}

