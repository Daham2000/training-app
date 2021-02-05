import "package:flutter/material.dart";

class FormTest extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormTest> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _name;
  String _postMassage;
  String _postDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Form fill Now"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
                margin: const EdgeInsets.all(24.0),
                child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                    maxLength: 10,
                    validator: (text){
                      if(text.isEmpty){
                        return 'Name con not be empty';
                      }
                      return null;
                    },
                    onSaved: (text){
                      _name = text;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Massage",
                    ),
                    maxLength: 30,
                    maxLines: 2,
                    validator: (text){
                      if(text.isEmpty){
                        return 'Name con not be empty';
                      }
                      return null;
                    },
                    onSaved: (text){
                      _postMassage = text;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                    ),
                    maxLength: 100,
                    maxLines: 10,
                    validator: (text){
                      if(text.isEmpty){
                        return 'Name con not be empty';
                      }
                      return null;
                    },
                    onSaved: (text){
                      _postDescription = text;
                    },
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  Container(
                  )
                ],
              )
            ),
          ),
        ),
    );
  }
}
