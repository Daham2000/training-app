import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class LoginState {
  String email;
  String userID;

  LoginState({@required this.email});

  LoginState.init() : this(email: null);

  LoginState clone({
    String name,
  }) {
    return LoginState(
        email: name ?? this.email);
  }

  static LoginState get initialState => LoginState(
        email: "",
      );
}
