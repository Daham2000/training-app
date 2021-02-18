import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';

class HomeProvider extends BlocProvider<HomeBloc> {
  HomeProvider({
    Key key,
    String email,
  }) : super(
          key: key,
          create: (context) => HomeBloc(context,email),
          child: HomeView(name: email),
        );
}
