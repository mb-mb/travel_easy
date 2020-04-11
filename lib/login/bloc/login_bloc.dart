import "package:bloc/bloc.dart";
import 'package:flutter/material.dart';
import 'package:travel_easy_v2/controller/authentication/authentication_bloc.dart';
import 'package:travel_easy_v2/controller/authentication/authentication_events.dart';
import 'package:travel_easy_v2/repository/user_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
//    LoginState currentState,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        List<Object> prop = event.props;
        if ((prop[0].toString().isEmpty) || (prop[1].toString().isEmpty)) {
          throw Exception("login incorrect");
        }

        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
