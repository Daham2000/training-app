import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:dear_diary/ui/login_page/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

import 'home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StreamSubscription _postSubscription;

  final _postRepository = PostRepository();

  HomeBloc(initialState) : super(HomeState.initialState);
  List<Post> list = [];

  //getAllPosts from here
  Future<String> getAllPosts() async{
    Future<List<Post>> query =
        PostRepository().query(specification: ComplexSpecification([])).first;
    list = await query;
  }

  Future<void> savePost(Post post) async {
    print("SavePost Bloc called...");
    PostRepository().add(
      item: new Post(
        userName: post.userName,
        massage: post.massage,
        description: post.description,
        created: post.created,
      ),
    );
  }

  String getName() {
    return "John";
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    switch (event.runtimeType) {
      case GetAllPosts:
        getAllPosts();
        break;

      case GetUserName:
        getName();
        break;

      case addPostCard:
        final data = event as addPostCard;
        savePost(data.post);
    }
  }

  @override
  Future<void> close() async {
    await _postSubscription.cancel();
    await super.close();
  }
}
