import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String foo;
  String msg;
  String description;

  CardWidget(this.foo, this.msg, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      margin: const EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "$msg",
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left:14.0),
                child: Text(
                  "$foo",
                  style: TextStyle(
                    fontSize: 14.0,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              "$description",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3.0, bottom: 10.0),
                child: InkWell(
                  // When the user taps the button, show a snackbar.
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Tap'),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: Text('SHOW MORE'),
                  ),
                ),
              ),
            ],
          ),

        ],


      ),

    );

  }
}
