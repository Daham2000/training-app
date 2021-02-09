import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:flutter/material.dart';

@immutable
class HomeState {
  final List<Post> posts;

  HomeState({@required this.posts});

  HomeState.init() : this(posts: null);

  HomeState clone({
    List<Post> posts,
  }) {
    return HomeState(posts: posts ?? this.posts);
  }
}
