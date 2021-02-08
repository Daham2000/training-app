import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:flutter/material.dart';

import 'DiaryCard.dart';

class CardList extends StatefulWidget {
  List<CardWidget> postWidgets = [];

  CardList(this.postWidgets);

  Future<void> setData() async{
    Future<List<CardWidget>> data = PostService().getData();
    postWidgets = await data;
    postWidgets = postWidgets.reversed.toList();
  }

  @override
  _CardListState createState() => _CardListState(postWidgets: postWidgets);
}

class _CardListState extends State<CardList> {
  List<CardWidget> postWidgets = [];

  _CardListState({this.postWidgets});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: postWidgets,
      scrollDirection: Axis.vertical,
    );
  }

}
