import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:travel_easy_v2/repository/user_repository.dart';

import 'authentication_events.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
//      bool hasToken = false;
//      userRepository.hasToken().then((onValue) {
//        if (onValue != false) {
//          hasToken = true;
//          AuthenticationAuthenticated();
//        }
//      });
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is Uninitialized) {
      yield AuthenticationLoading();
      yield AuthenticationUnauthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
