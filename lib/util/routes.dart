import 'package:dear_diary/ui/client_home_page/home_page_provider.dart';
import 'package:dear_diary/ui/root_page/login_page.dart';
import 'package:flutter/material.dart';

abstract class Routes{
  Routes._();

  static const LOGIN_ROUTE = "login";
  static const HOME_ROUTE = "home";

  static final login = LoginProvider();
  static final home = HomeProvider();

  static Route generator(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (context) => login);

      case HOME_ROUTE:
        return MaterialPageRoute(builder: (context) => home);

      default:
        return MaterialPageRoute(builder: (context) => login);
    }
  }
}