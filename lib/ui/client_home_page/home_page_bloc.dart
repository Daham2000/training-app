import 'dart:async';

import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';

import 'home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  StreamSubscription _postSubscription;

  final _postRepository = PostRepository();

  HomeBloc(initialState) : super(initialState);

  //getAllPosts from here
  void getAllPosts() {
    _postSubscription?.cancel();
    _postSubscription = _postRepository
        .query(specification: ComplexSpecification([]))
        .listen((event) {
      add(GetAllPosts(event));
    });
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) {
    switch (event.runtimeType) {
      case GetAllPosts:
        getAllPosts();
    }
  }

  @override
  Future<void> close() async {
    await _postSubscription.cancel();
    await super.close();
  }
}
