import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/blocs/login_bloc.dart';
import 'package:toeic/events/authentication_event.dart';
import 'package:toeic/events/login_event.dart';
import 'package:toeic/pages/button/facebook_login_button.dart';
import 'package:toeic/pages/button/google_login_button.dart';
import 'package:toeic/pages/button/login_button.dart';
import 'package:toeic/pages/button/register_user_button.dart';
import 'package:toeic/repositories/user_repository.dart';
import 'package:toeic/states/login_state.dart';

class LoginPage extends StatefulWidget {
  final UserRepository _userRepository;
  //constructor
  LoginPage({Key, key, @required UserRepository userRepository}):
      assert(userRepository != null),
      _userRepository = userRepository,
      super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  UserRepository get _userRepository => widget._userRepository;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(() {
      //when email is changed, this function is called
      _loginBloc.add(LoginEventEmailChanged(email: _emailController.text));
    });
    _passwordController.addListener(() {
      //pass
      _loginBloc.add(LoginEventPasswordChanged(password: _passwordController.text));
    });
  }
  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
  bool isLoginButtonEnabled(LoginState loginState) =>
      loginState.isValidEmailAndPassword & isPopulated && !loginState.isSubmitting;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState) {
          if (loginState.isFailure) {
            print('Login Failed!');
          } else if (loginState.isSubmitting) {
            print('Logging in');
          } else if (loginState.isSuccess) {
            BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedIn());
          }
          return Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/Toeicez.png'),
                            fit: BoxFit.fitWidth),
                      )
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Learn TOEIC your own pace',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(144, 137, 137, 1),
                        fontFamily: 'Roboto',
                        fontSize: 19,
                    ),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Enter your email'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: false,
                    validator: (_) {
                      return loginState.isValidEmail ? null : 'Invalid email format';
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        labelText: 'Enter your password'
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.always,
                    autocorrect: false,
                    validator: (_) {
                      return loginState.isValidPassword ? null : 'Invalid password format';
                    }),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        LoginButton(
                          onPressed: isLoginButtonEnabled(loginState)?
                          _onLoginEmailAndPassword : null, //check is enable?
                        ),
                        Padding(padding: EdgeInsets.only(top: 10),),
                        RegisterUserButton(userRepository: _userRepository,),
                        Padding(padding: EdgeInsets.only(top: 10),),
                        Text(
                          '- OR -',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(144, 137, 137, 1),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10),),
                        GoogleLoginButton(),
                        Padding(padding: EdgeInsets.only(top: 10),),
                        FacebookLoginButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void _onLoginEmailAndPassword() {
    _loginBloc.add(LoginEventWithEmailAndPasswordPressed(
        email: _emailController.text,
        password: _passwordController.text));
  }
}