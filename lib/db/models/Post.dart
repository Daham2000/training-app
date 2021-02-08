import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

class Post extends DBModel{
  String UserName;
  String massage;
  String description;
  Timestamp created;

  Post(String UserName, String massage, String description, Timestamp created){
    this.UserName =UserName;
    this.massage = massage;
    this.description = description;
    this.created = created;
  }
}