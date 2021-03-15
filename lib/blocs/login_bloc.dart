import 'package:flutter/cupertino.dart';
import 'package:toeic/events/login_event.dart';
import 'package:toeic/repositories/user_repository.dart';
import 'package:toeic/states/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;
  //constructor
  LoginBloc({@required UserRepository userRepository}):
        assert(userRepository != null),
        _userRepository = userRepository,
        super(LoginState.initial());
  //Give 2 adjacent events a "debounce time"
  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(Stream<LoginEvent> loginEvents, transitionFunction) {
    final debounceStream = loginEvents.where((loginEvent) {
      return (loginEvent is LoginEventEmailChanged || loginEvents is LoginEventPasswordChanged);
    }).debounceTime(Duration(microseconds: 300)); //minimum 300ms for each event
    final nonDebounceStream = loginEvents.where((event) {
      return (loginEvents is! LoginEventEmailChanged && loginEvents is! LoginEventPasswordChanged);
    });
    return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]), transitionFunction);
  }
  @override
  Stream<LoginState> mapEventToState(LoginEvent loginEvent) async*{
    final loginState = state; //for easier understand
    if (loginEvent is LoginEventEmailChanged) {
      yield loginState.cloneAndUpdate(isValidEmail: Validators.isValidEmail(loginEvent.email));
    } else if (loginEvent is LoginEventPasswordChanged) {
      yield loginState.cloneAndUpdate(isValidPassword: Validators.isValidPassword(loginEvent.password));
    } else if (loginEvent is LoginEventWithGooglePressed) {
      try {
        await _userRepository.signInWithGoogle();
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    } else if (loginEvent is LoginEventWithFacebookPressed) {
      try {
        await _userRepository.loginWithFacebook();
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    } else if (loginEvent is LoginEventWithEmailAndPasswordPressed) {
      try {
        await _userRepository.signInWithEmailAndPassword(loginEvent.email, loginEvent.password);
        yield LoginState.success();
      } catch (_) {
        yield LoginState.failure();
      }
    }
  }
}