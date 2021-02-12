import 'package:dear_diary/db/models/Post.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class GetAllPostsEvent extends HomeEvent {
  final List<Post> all;

  GetAllPostsEvent(this.all);
}

class GetUserName extends HomeEvent {
  GetUserName();
}

class AddPostCardEvent extends HomeEvent {
  final Post post;

  AddPostCardEvent(this.post);
}
