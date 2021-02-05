import 'package:dear_diary/screens/loginPage.dart';
import "package:flutter/material.dart";

class SecondScreen extends StatelessWidget {

  var items = List<String>.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Second Screen list View"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: (){
            Navigator.pop(
                context,
                Loginpage()
            );
          },
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(items[index]),
            );
          },
      ),
    );
  }
}
