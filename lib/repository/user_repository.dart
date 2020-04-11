import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:travel_easy_v2/controller/authentication/auth.dart';

class UserRepository {
  final Auth authApi;

  UserRepository({@required this.authApi});

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    // delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    // write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
//    return await authApi.currentUser().then((email) {
//      return (null != email);
//    });

    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
