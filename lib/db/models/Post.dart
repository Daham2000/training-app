import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

class Post extends DBModel {
  static const USERNAME = "userName";
  static const MASSAGE = "massage";
  static const DESCRIPTION = "description";
  static const CREATED = "created";

  String userName;
  String massage;
  String description;
  Timestamp created;

  Post(
      {DocumentReference ref,
      this.userName,
      this.massage,
      this.description,
      this.created})
      : super(ref: ref);

  @override
  DBModel clone() {
    // TODO: implement clone
    return Post(
        ref: ref,
        userName: userName,
        massage: massage,
        description: description,
        created: created);
  }
}
