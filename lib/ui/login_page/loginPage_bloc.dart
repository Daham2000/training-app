import 'dart:async';
import 'package:dear_diary/db/authentication.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static final log = Log("LoginBloc");
  FirebaseAuth _firebaseAuth;
  Authentication _authentication = Authentication();

  Stream<User> get authStateChanged => _firebaseAuth.authStateChanges();

  LoginBloc(BuildContext context) : super(LoginState.initialState);

  Future<String> SignUp({String email, String password}) async {
    final result = await _authentication.register(email, password);
    print("Signed up");
  }

  void saveName(String email) {
    this.state.email = email;
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    switch (event.runtimeType) {
      case SaveUserNameEvent:
        final data = event as SaveUserNameEvent;
        saveName(data.name);
        print("state data name-----: ${this.state.email}");
        break;

      case SigninEvent:
        final data = event as SigninEvent;
        final result = await _authentication.login(data.email, data.password);
        yield state.clone(name: result);
        print("${state.email}");
        break;

      case SignUpEvent:
        final data = event as SignUpEvent;
        SignUp(email: data.email, password: data.password);
        break;
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
}
