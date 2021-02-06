import "package:flutter/material.dart";
import 'views/root_page/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dear Diary",
      home: FutureBuilder(
        future: _fbApp,
        builder: (context,snapshot){
          if(snapshot.hasError){
            print("You have an error ${snapshot.error.toString()}");
            return Text("Something went wrong");
          }else if(snapshot.hasData){
            return Loginpage();
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )

    );
  }
}

