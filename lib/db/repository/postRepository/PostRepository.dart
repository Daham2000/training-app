import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';

class PostService{
  final String pid;
  PostService({this.pid});
  final CollectionReference postCollection = FirebaseFirestore.instance.collection("Posts");
  
  Future updatePostData(Post post) async{
    return await postCollection.doc(pid).set({
      "UserName":post.UserName,
      "massage":post.massage,
      "description":post.description,
      "created" : post.created
    });
  }
  
}