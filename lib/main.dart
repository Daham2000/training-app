import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/root_page/loginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
    return StreamProvider<QuerySnapshot>.value(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Dear Diary",
          home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("You have an error ${snapshot.error.toString()}");
                return Text("Something went wrong");
              } else if (snapshot.hasData) {
                return Loginpage();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
