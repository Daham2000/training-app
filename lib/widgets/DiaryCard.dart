import 'package:dear_diary/theme/primary_theme.dart';
import 'package:dear_diary/theme/style_color.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String foo;
  String msg = "Reasons why english learning is so important";
  String description =
      "English is the Language of International Communication \n"
      "English gives access to more entertainment and more access to the Internet \n"
      "English makes it easier to travel";

  CardWidget(this.foo, this.msg, this.description);

  @override
  Widget build(BuildContext context) {
    theme: PrimaryTheme.generateTheme(context);
    return Card(
      color: StyleColors.LIGHT_BLUE,
      margin: const EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, bottom: 6, right: 5),
                  child: Text(
                    "$msg",
                    style: TextStyle(
                      fontSize: 33.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "$foo",
                    style: TextStyle(
                      fontSize: 14.0,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "$description",
                    style: TextStyle(
                      fontSize: 19.0,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ),
              ),
            ],
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
                      content: Text('Not more data'),
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
