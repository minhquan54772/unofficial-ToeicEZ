import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LoginEventEmailChanged extends LoginEvent {
  final String email;
  //constructor
  const LoginEventEmailChanged({this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
  @override
  String toString() => 'LoginEventEmail changed: $email';
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;
  //constructor
  const LoginEventPasswordChanged({this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
  @override
  String toString() => 'LoginEventPassword changed: $password';
}
//press "Sign in with Google"
class LoginEventWithGooglePressed extends LoginEvent {}
class LoginEventWithFacebookPressed extends LoginEvent {}
class LoginEventWithEmailAndPasswordPressed extends LoginEvent {
  final String email;
  final String password;
  const LoginEventWithEmailAndPasswordPressed({
    @required this.email,
    @required this.password
  });
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
  @override
  String toString() => 'LoginEventSubmitted, email = $email, password = $password';
}