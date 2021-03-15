import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class RegisterEventEmailChanged extends RegisterEvent {
  final String email;
  //constructor
  const RegisterEventEmailChanged({@required this.email});
  @override
  // TODO: implement props
  List<Object> get props => [email];
  @override
  String toString() => 'RegisterEventEmail changed: $email';
}

class RegisterEventPasswordChanged extends RegisterEvent {
  final String password;
  //constructor
  const RegisterEventPasswordChanged({@required this.password});
  @override
  // TODO: implement props
  List<Object> get props => [password];
  @override
  String toString() => 'RegisterEventPassword changed: $password';
}
class RegisterEventPressed extends RegisterEvent {
  final String email;
  final String password;
  const RegisterEventPressed({
    @required this.email,
    @required this.password
  });
  @override
  // TODO: implement props
  List<Object> get props => [email, password];
  @override
  String toString() => 'RegisterEventSubmitted, email = $email, password = $password';
}