import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:flutter/material.dart';

@immutable
class HomeState {
  final List<Post> posts;
  final String name;

  HomeState({@required this.posts, @required this.name});

  HomeState.init() : this(posts: null, name: "");

  HomeState clone({List<Post> posts, String name}) {
    return HomeState(posts: posts ?? this.posts, name: name ?? this.name);
  }
}
