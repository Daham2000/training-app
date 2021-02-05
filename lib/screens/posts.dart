import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:badges/badges.dart';

class PostState extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<PostState> {

  var items = List<String>.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    int counter = 3;

    return Scaffold(

      appBar: AppBar(
        title: Text("Dear diary posts"),
        backgroundColor: Colors.blueAccent,

        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Badge(
              badgeContent: Text('$counter'),
              position: BadgePosition.topEnd(top: 5.0),
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
