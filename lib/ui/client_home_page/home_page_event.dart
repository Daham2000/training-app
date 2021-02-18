import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class GetAllPostsEvent extends HomeEvent {
  final List<Post> all;

  GetAllPostsEvent(this.all);
}

class GetPostByDataEvent extends HomeEvent {
  final Timestamp date;

  GetPostByDataEvent(this.date);
}

class GetUserName extends HomeEvent {
  GetUserName();
}

class AddPostCardEvent extends HomeEvent {
  final Post post;

  AddPostCardEvent(this.post);
}
