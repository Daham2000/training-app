import 'package:dear_diary/views/client_home_page/posts.dart';
import 'package:flutter/material.dart';

class FormView extends StatelessWidget {
  String name;
  String msg;
  String description;

  Function callback;

  FormView(this.name, this.callback);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(

      color: Colors.blueAccent,
      margin: const EdgeInsets.all(10.0),
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
                      callback(msg, description);
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

    );
  }
}
