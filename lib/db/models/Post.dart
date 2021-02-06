import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

class Post{
  String UserName;
  String massage;
  String description;
  DateTime created;

  Post(String UserName, String massage, String description, DateTime created){
    this.UserName =UserName;
    this.massage = massage;
    this.description = description;
    this.created = created;
  }
}