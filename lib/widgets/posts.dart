import 'package:flutter/material.dart';

class Posts extends StatelessWidget {

  var items = List<String>.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
