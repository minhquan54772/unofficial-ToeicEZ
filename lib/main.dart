import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toeic/blocs/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/blocs/login_bloc.dart';
import 'package:toeic/events/authentication_event.dart';
import 'package:toeic/pages/home_page.dart';
import 'package:toeic/pages/login_page.dart';
import 'package:toeic/repositories/user_repository.dart';
import 'package:toeic/states/authentication_state.dart';
import 'package:toeic/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    //signout for testing firstly
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'ToeicEZ Application',
          home: BlocProvider(
            create: (context) => AuthenticationBloc(userRepository: _userRepository)..add(AuthenticationEventStarted()),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, authenticationState) {
                if (authenticationState is AuthenticationStateSuccess) {
                  return HomePage();
                } else if (authenticationState is AuthenticationStateFailure) {
                  return BlocProvider<LoginBloc>(
                      create: (context) => LoginBloc(userRepository: _userRepository),
                      child: LoginPage(userRepository: _userRepository,)//LoginPage,
                  );
                }
                return SplashPage();
              },
            ),
          ),
        );
      },
    );

  }
}
