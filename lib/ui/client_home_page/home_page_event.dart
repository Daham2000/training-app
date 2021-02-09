import 'package:dear_diary/db/models/Post.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class GetAllPosts extends HomeEvent {
  final List<Post> all;

  GetAllPosts(this.all);
}
