import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:flutter/material.dart';

class PostService{
  final String pid;
  PostService({this.pid});

  //CollectionReference
  final CollectionReference postCollection = FirebaseFirestore.instance.collection("Posts");

  //CardWidget List
  List<CardWidget> postWidgets = [new CardWidget("Noor","Reasons why english learning is so important","English is the Language of International Communication \n"
      "English gives access to more entertainment and more access to the Internet \n"
      "English makes it easier to travel")];

  //PostData
  Future updatePostData(Post post) async{
    return await postCollection.doc(pid).set({
      "UserName":post.UserName,
      "massage":post.massage,
      "description":post.description,
      "created" : post.created
    });
  }

  //getData
  Future<List<CardWidget>> getData() async{
    await fetchData();
    print(postWidgets.length);
    return postWidgets;
  }

  //fetchdata
  Future fetchData() async{
    postWidgets.clear();
    await postCollection.get().then((querySnapshot) => {
      querySnapshot.docs.forEach((result) {
        var cardWidget = new CardWidget(result.get("UserName"),result.get("massage"),
            result.get("description"));
        postWidgets.add(cardWidget);
      }),
    });
    print(postWidgets.length);
  }

}