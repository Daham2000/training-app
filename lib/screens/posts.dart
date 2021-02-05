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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int counter = 3;

    String mas;
    String description;

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
        child: Column(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[

                       Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: TextFormField(
                           validator: (value) {
                             if (value.isEmpty) {
                               return 'Please enter some text';
                             }
                             return null;
                           },
                           decoration: InputDecoration(
                             hintStyle: TextStyle(
                               color: Colors.white,
                             ),
                             labelStyle: TextStyle(
                               color: Colors.white,
                               fontSize: 18.0
                             ),
                             hintText: "Type the massage here",
                             labelText: "Massage",
                             focusColor: Colors.white
                           ),
                           maxLines: 1,
                           maxLength: 20,
                           style: TextStyle(
                             color: Colors.white,
                           ),
                         ),
                       ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter description text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0
                              ),
                              hintText: "Type the description here",
                              labelText: "Description",
                              focusColor: Colors.white
                          ),
                          maxLines: 5,
                          maxLength: 50,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Scaffold.of(context)
                                // ignore: deprecated_member_use
                                    .showSnackBar(SnackBar(content: Text('Post adding wait...')));
                              }
                            },
                            child: Text('Submit', style: TextStyle(
                              fontSize: 18.0,
                            ),),

                          ),
                        ),
                      ),

                    ],
                ),
            ),
          ],
        )
      ),
    );
  }
}
