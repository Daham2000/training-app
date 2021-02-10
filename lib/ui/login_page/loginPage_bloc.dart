import 'dart:async';

import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(initialState) : super(initialState);

  void saveName(String name){
    this.state.name = name;
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    switch(event.runtimeType){
      case SaveUserName:
        saveName("FFF");
    }
  }

}