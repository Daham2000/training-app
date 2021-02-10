import 'dart:async';
import 'dart:html';

import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(initialState) : super(initialState);

  void saveName(String name){

  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    switch(event.runtimeType){
      case SaveUserName:

    }
  }

}