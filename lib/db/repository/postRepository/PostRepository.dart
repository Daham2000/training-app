import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/util/db_util.dart';
import 'package:dear_diary/widgets/DiaryCard.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PostRepository extends FirebaseRepository<Post> {
  @override
  Post fromSnapshot(DocumentSnapshot snapshot) {
    // TODO: implement fromSnapshot
    if (snapshot == null) return null;
    final data = snapshot.data();
    if (data == null) return null;

    try {
      return Post(
        ref: snapshot.reference,
        userName: data[Post.USERNAME],
        massage: data[Post.MASSAGE],
        description: data[Post.DESCRIPTION],
        created: data[Post.CREATED],
      );
    } catch (err) {
      print("fetching error found-------->${err}");
      return null;
    }
  }

  @override
  Map<String, dynamic> toMap(Post item) {
    return {
      Post.USERNAME: item.userName,
      Post.MASSAGE: item.massage,
      Post.DESCRIPTION: item.description,
      Post.CREATED: item.created
    };
  }

  @override
  Stream<List<Post>> query(
      {@required SpecificationI specification,
      String type,
      DocumentReference parent}) {
    // TODO: implement query
    return super.query(specification: specification, type: DBUtill.POST);
  }

  @override
  Future<List<Post>> querySingle(
      {@required SpecificationI specification,
      String type,
      DocumentReference parent}) {
    return super.querySingle(specification: specification, type: DBUtill.POST);
  }

  @override
  Future<DocumentReference> add(
      {@required Post item, String type, DocumentReference parent}) {
    // TODO: implement add
    return super.add(item: item, type: DBUtill.POST, parent: parent);
  }
}
