import 'dart:async';

import 'package:dear_diary/db/repository/postRepository/PostRepository.dart';
import 'package:dear_diary/ui/client_home_page/home_page.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static final log = Log("LoginBloc");

  LoginBloc(BuildContext context) : super(LoginState.initialState);

  void saveName(String name) {
    this.state.name = name;
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) {
    switch (event.runtimeType) {
      case SaveUserNameEvent:
        final data = event as SaveUserNameEvent;
        saveName(data.name);
        print("state data name-----: ${this.state.name}");
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    log.e('$stacktrace');
    log.e('$error');
  }

  @override
  Future<void> close() async {
    await super.close();
  }
}
