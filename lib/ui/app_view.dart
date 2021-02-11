import 'package:dear_diary/theme/primary_theme.dart';
import 'package:dear_diary/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_page/login_page.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dear Diary",
      theme: PrimaryTheme.generateTheme(context),
      home: LoginView(),
      onGenerateRoute: Routes.generator,
    );

    final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
    return StreamProvider<QuerySnapshot>.value(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print("You have an error ${snapshot.error.toString()}");
                return Text("Something went wrong");
              } else if (snapshot.hasData) {
                return materialApp;
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
