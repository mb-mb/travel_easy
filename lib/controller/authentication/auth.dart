import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel_easy_v2/models/user_auth.dart';
import 'package:travel_easy_v2/repository/repository.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<UserAuth> currentUser();
  Future<void> signedOut();
}

class Auth implements BaseAuth {
  final Repository repository;

  Auth({@required this.repository});

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserAuth user = await repository.signInWithEmailAndPassword(
        email: email, password: password);

    return user.userName;
  }

  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    UserAuth user = await repository.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.userName;
  }

  Future<UserAuth> currentUser() async {
    print('auth().currentUser() call');
    return repository.currentUser().then((value) {
      if (value != null) {
        print('auth().currentUser() return ${value.email}');
        UserAuth user = UserAuth(value.displayName, value.email, DateTime.now(),
            DateTime.now(), value.getIdToken().toString());
        return user;
      }
      return null;
    });
  }

  Future<void> signedOut() async {
    return await repository.signOut();
  }
}
