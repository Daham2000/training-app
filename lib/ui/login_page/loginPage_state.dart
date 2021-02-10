import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:flutter/material.dart';

@immutable
class LoginState {
  String name;

  LoginState({@required this.name});

  LoginState.init() : this(name: null);

  LoginState clone({
    String name,
  }) {
    return LoginState(name: name ?? this.name);
  }
}
