import 'package:dear_diary/widgets/card.dart';
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

    String msg="Reasons why english learning is so important";
    String description = "English is the Language of International Communication \n"
        "English gives access to more entertainment and more access to the Internet \n"
        "English makes it easier to travel";

    return Scaffold(

      appBar: AppBar(
        title: Text("Dear, $foo"),
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
      body: ListView(
            children: <Widget>[
              Card(
                color: Colors.blueAccent,
                margin: const EdgeInsets.all(12.0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                    key: _formKey,
                    child: Column(
                        children: <Widget>[

                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 12.0),
                             child: TextFormField(
                               autofocus: false,
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return 'Please enter some text';
                                 }else{
                                   msg = value;
                                 }
                                 return null;
                               },
                               decoration: InputDecoration(
                                   alignLabelWithHint: true,
                                   fillColor: Colors.blueAccent[300],
                                   filled: true,
                                   border: new OutlineInputBorder(
                                     borderSide: BorderSide.none,
                                     borderRadius: const BorderRadius.all(
                                           const Radius.circular(50.0),
                                     ),
                                   ),
                                 hintStyle: TextStyle(
                                   color: Colors.white,
                                 ),
                                 labelStyle: TextStyle(
                                   color: Colors.black45,
                                   fontSize: 18.0
                                 ),
                                 labelText: "Submit New",
                                 focusColor: Colors.white
                               ),
                               maxLines: 1,
                               style: TextStyle(
                                 color: Colors.white,
                               ),
                             ),
                           ),

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              autofocus: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter description text';
                                }else{
                                  description = value;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                fillColor: Colors.blueAccent[300],
                                  filled: true,
                                  border: new OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(20.0),
                                      ),
                                  ),
                                  labelStyle: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 18.0,
                                  ),
                                  labelText: "Enter Description",
                                  focusColor: Colors.white
                              ),
                              maxLines: 5,
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
                                  primary: Colors.blueAccent[700],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {

                                  }
                                },
                                child: Text('SUBMIT', style: TextStyle(
                                  fontSize: 18.0,
                                ),),

                              ),
                            ),
                          ),

                        ],
                    ),
                ),
              ),

              CardWidget(
                foo,msg,description
              ),

            ],
          )
        );
  }
}
