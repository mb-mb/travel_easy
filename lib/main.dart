import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:travel_easy_v2/repository/repository.dart';

import 'package:travel_easy_v2/repository/user_repository.dart';

import 'controller/authentication/auth.dart';
import 'controller/authentication/authentication_bloc.dart';
import 'controller/authentication/authentication_events.dart';
import 'controller/authentication/authentication_state.dart';
import 'login/view/login_form.dart';
import 'login/view/login_page.dart';
import 'login/view/logn_indicator.dart';

//class MyApp extends StatelessWidget {
//
//
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        accentColor: Colors.lightBlue.shade100,
//        primaryColor: Colors.lightBlue.shade500,
//        primarySwatch: Colors.lightBlue,
//      ),
//      home: LoginScreen(),
//      // MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    //print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    //print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    //print(error);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App(
      userRepository: UserRepository(authApi: Auth(repository: Repository()))));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  AuthenticationBloc authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  startSplash() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, splashPageView);
  }

  void splashPageView() {
//    SplashPage(delegate: this);
  }

  void navigationPage() {
    //Navigator.of(context).pushReplacementNamed("/HomeScreen");
    return authenticationBloc.dispatch(AppStarted());
  }

  @override
  void initState() {
    super.initState();
    authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    authenticationBloc.dispatch(AppStarted());
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.lightBlue.shade100,
          primaryColor: Colors.lightBlue.shade500,
          primarySwatch: Colors.lightBlue,
        ),
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
            bloc: authenticationBloc,
            // ignore: missing_return
            builder: (BuildContext context, AuthenticationState state) {
              print('state is {$state}');
              if (state is AuthenticationUninitialized) {
                return LoadingIndicator();
              }
              if (state is AuthenticationUnauthenticated) {
                return LoginPage(
                  userRepository: _userRepository,
                );
              }
              if (state is AuthenticationLoading) {
                return LoadingIndicator();
              }
              if (state is AuthenticationAuthenticated) {
                return Container(
                  child: Center(child: Text("logged")),
                );
              }
            }),
      ),
    );
  }
}

// TODO: /api/Authentication
// TODO: /api/Trip/GetTrips

// http://68.183.102.189/api/v1/Destination?City=Sao%20tome%20das%20letras&Country=MG&Price=150.50
