import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';

class PostState extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<PostState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Dear diary posts"),
        backgroundColor: Colors.blueAccent,

        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (){
              },
            ),
          ],
        ),

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
