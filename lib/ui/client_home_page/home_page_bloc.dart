import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

import 'home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StreamSubscription _postSubscription;
  String email;

  final _postRepository = PostRepository();

  HomeBloc(BuildContext context, String email) : super(HomeState.init()) {
    getAllPosts(email);
  }

  //getAllPosts from here
  getAllPosts(String email) {
    this.email = email;
    _postSubscription?.cancel();
    _postSubscription = _postRepository
        .query(
            specification: ComplexSpecification(
                [ComplexWhere(Post.USERNAME, isEqualTo: email)]))
        .listen((event) {
      add(GetAllPostsEvent(event));
    });
  }

  //get posts by date
  getPostsByDate(Timestamp date) {
    _postSubscription?.cancel();
    _postSubscription = _postRepository
        .query(
            specification: ComplexSpecification([
      ComplexWhere(Post.USERNAME, isEqualTo: email),
      ComplexWhere(Post.CREATED, isEqualTo: date)
    ]))
        .listen((event) {
      add(GetAllPostsEvent(event));
    });
  }

  Future<void> savePost(Post post) async {
    _postRepository.toMap(post);
    _postRepository.add(
      item: new Post(
        userName: post.userName,
        massage: post.massage,
        description: post.description,
        created: post.created,
      ),
    );
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.runtimeType) {
      case GetAllPostsEvent:
        final posts = (event as GetAllPostsEvent).all;
        yield state.clone(posts: posts);
        break;

      case AddPostCardEvent:
        final data = event as AddPostCardEvent;
        savePost(data.post);
        break;

      case GetPostByDataEvent:
        final data = event as GetPostByDataEvent;
        getPostsByDate(data.date);
        break;
    }
  }

  @override
  Future<void> close() async {
    await _postSubscription.cancel();
    await super.close();
  }
}
