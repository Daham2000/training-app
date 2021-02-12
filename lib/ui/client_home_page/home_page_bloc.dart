import 'dart:async';

import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

import 'home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StreamSubscription _postSubscription;

  final _postRepository = PostRepository();

  HomeBloc(BuildContext context) : super(HomeState.init()) {
    getAllPosts();
  }

  //getAllPosts from here
  getAllPosts() {
    _postSubscription?.cancel();
    _postSubscription = _postRepository
        .query(specification: ComplexSpecification([]))
        .listen((event) {
      add(GetAllPostsEvent(event));
    });
  }

  Future<void> savePost(Post post) async {
    print("SavePost Bloc called...");
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
    }
  }

  @override
  Future<void> close() async {
    await _postSubscription.cancel();
    await super.close();
  }
}
