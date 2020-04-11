import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_easy_v2/contants.dart';
import 'package:travel_easy_v2/controller/authentication/auth.dart';
import 'package:travel_easy_v2/controller/authentication/authentication_bloc.dart';
import 'package:travel_easy_v2/login/bloc/login_bloc.dart';
import 'package:travel_easy_v2/login/bloc/login_event.dart';
import 'package:travel_easy_v2/login/bloc/login_state.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  const LoginForm({Key key, this.loginBloc, this.authenticationBloc})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.white,
              ),
              hintText: 'informe seu email',
            ),
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: kBoxDecorationStyle,
          child: TextFormField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'informe sua senha',
            ),
            controller: _passwordController,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Esqueci a senha button pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text('Esqueci a senha', style: kLabelStyle),
      ),
    );
  }

  Widget _rememberMeForgotPassword() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Permanecer com login',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    Fluttertoast.showToast(msg: text, toastLength: Toast.LENGTH_LONG);
  }

  doLogin() async {
    _loginBloc.dispatch(LoginButtonPressed(
        username: _emailController.text, password: _passwordController.text));
  }

  Widget _loginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => doLogin(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
              color: Color(0xFF5227DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _anotherLogin() {
    return Column(
      children: <Widget>[
        Text(
          '- OU -',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Login com',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _facebookLogin() {
    return GestureDetector(
      onTap: () => print('login with pressed'),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(
              image: AssetImage('assets/facebook.jpg'),
            )),
      ),
    );
  }

  Widget _signUpButton() {
    return GestureDetector(
      onTap: () => print('sign up pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Não tem uma conta ainda ?  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Criar conta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            image: DecorationImage(image: logo),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    String _validationText = "";
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state) {
          if (state is LoginFailure) {
            _validationText = "login failure";
          }

          return Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff73AEF5),
                          Color(0Xff61A4F1),
                          Color(0xFF478DE0),
                          Color(0XFF398AE5),
                        ],
                        stops: [0.1, 0.4, 0.7, 0.9],
                      )),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 120.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'EasyTrip',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  letterSpacing: 1.5,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Form(
                              child: Column(
                                children: <Widget>[
                                  _buildEmailTF(),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  _buildPasswordTF(),
                                ],
                              ),
                            ),
                            _buildForgotPassword(),
                            _rememberMeForgotPassword(),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      _validationText,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            _loginButton(),
                            _anotherLogin(),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                _buildSocialBtn(
                                    () => print('login with facebook'),
                                    AssetImage('facebook.png')),
                                _buildSocialBtn(
                                    () => print('login with google'),
                                    AssetImage('google.png')),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            _signUpButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
