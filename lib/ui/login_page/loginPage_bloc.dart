import 'dart:async';
import 'package:dear_diary/db/authentication.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static final log = Log("LoginBloc");
  Authentication _authentication = Authentication();

  LoginBloc(BuildContext context) : super(LoginState.initialState);

  Future<String> SignUp({String email, String password}) async {}

  // Stream<LoginState> _handleUserLogged(String email, String password) async* {
  //   if (state.userLogged) {
  //     return;
  //   }
  //   if (email != null && email.isNotEmpty) {
  //     yield state.clone(isUserSignUpd: true);
  //   }
  // }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case SigninEvent:
        final data = event as SigninEvent;
        final fetchEmail =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(data.email);
        if (fetchEmail.isEmpty) {
          add(ErrorEvent("User does not exist.Please SignUp."));
          break;
        }
        try {
          final result = await _authentication.login(data.email, data.password);
          yield state.clone(
              email: result.user.email, userId: result.user.uid, error: "");
        } on FirebaseAuthException catch (e) {
          add(ErrorEvent("Something went wrong. Please try again !"));
          yield state.clone(error: "${e.message}");
        }
        break;

      case SignUpEvent:
        final data = event as SignUpEvent;
        try {
          final result =
              await _authentication.register(data.email, data.password);
          yield state.clone(isUserSignUpd: true);
        } on FirebaseAuthException catch (e) {
          add(ErrorEvent("Something went wrong. Please try again !"));
          yield state.clone(isUserSignUpd: false);
        }
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
