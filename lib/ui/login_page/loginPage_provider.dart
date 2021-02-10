import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_page.dart';

class LoginProvider extends BlocProvider<LoginBloc>{
  LoginProvider({
    Key key
  }): super(
    key: key,
    create: (context) => LoginBloc(context),
    child: LoginView(),
  );
}