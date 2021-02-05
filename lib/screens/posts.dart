import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:badges/badges.dart';
import 'package:dear_diary/models/post.dart';

String userName;

class PostState extends StatefulWidget {

  final String UserName;

  PostState(this.UserName);

  @override
  _PostState createState() => _PostState(foo: this.UserName);
}

class _PostState extends State<PostState> {

  String foo;

  _PostState({this.foo});

  var items = List<String>.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    int counter = 3;

    return Scaffold(

      appBar: AppBar(
        title: Text("Dear $foo"),
        backgroundColor: Colors.blueAccent,

        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Badge(
              badgeContent: Text('$counter', style: TextStyle(
                color: Colors.white,
              ),),
              position: BadgePosition.topEnd(top: 6.0, end: -4.0),
              child: Icon(
                  Icons.notifications,
                size: 30.0,
              ),
            ),
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 15.0),
            icon: const Icon(Icons.person_rounded, color: Colors.white,),
          )

        ],

      ),

      backgroundColor: Colors.blue,
      body: Container(
        child: Row(
          children: <Widget>[
          ],
        )
      ),
    );
  }
}
