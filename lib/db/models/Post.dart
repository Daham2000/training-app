import 'package:fcode_bloc/fcode_bloc.dart';

class Post{
  String UserName;
  String massage;
  String description;

  Post(String UserName, String massage, String description){
    this.UserName =UserName;
    this.massage = massage;
    this.description = description;
  }
}