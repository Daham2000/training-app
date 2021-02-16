import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dear_diary/db/models/Post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class LoginState {
  final String error;
  final String email;
  final String userId;
  final bool isUserSignUpd;

  LoginState({
    @required this.error,
    @required this.email,
    @required this.userId,
    @required this.isUserSignUpd,
  });

  LoginState clone({
    String error,
    String email,
    String userId,
    bool isUserSignUpd,
  }) {
    return LoginState(
      error: error ?? this.error,
      email: email ?? this.email,
      userId: userId ?? this.userId,
      isUserSignUpd: isUserSignUpd ?? this.isUserSignUpd,
    );
  }

  static LoginState get initialState => LoginState(
        error: "",
        email: "",
        userId: "",
        isUserSignUpd: false,
      );
}
