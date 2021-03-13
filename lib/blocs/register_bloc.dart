import 'dart:async';
import 'package:meta/meta.dart';
import 'package:toeic/events/register_event.dart';
import 'package:toeic/repositories/user_repository.dart';
import 'package:toeic/states/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toeic/validators/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository _userRepository;
  //constructor
  RegisterBloc({@required UserRepository userRepository}):
        assert(userRepository != null),
        _userRepository = userRepository,
        super(RegisterState.initial());
  //Give 2 adjacent events a "debounce time"
  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(Stream<RegisterEvent> registerEvents, transitionFunction) {
    final debounceStream = registerEvents.where((registerEvent) {
      return (registerEvent is RegisterEventEmailChanged || registerEvents is RegisterEventPasswordChanged);
    }).debounceTime(Duration(microseconds: 300)); //minimum 300ms for each event
    final nonDebounceStream = registerEvents.where((event) {
      return (registerEvents is! RegisterEventEmailChanged && registerEvents is! RegisterEventPasswordChanged);
    });
    return super.transformEvents(nonDebounceStream.mergeWith([debounceStream]), transitionFunction);
  }
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent registerEvent) async*{
    if (registerEvent is RegisterEventEmailChanged) {
      yield state.cloneAndUpdate(
          isValidEmail: Validators.isValidEmail(registerEvent.email)
      );
    } else if (registerEvent is RegisterEventPasswordChanged) {
      yield state.cloneAndUpdate(
          isValidPassword: Validators.isValidPassword(registerEvent.password)
      );
    } else if (registerEvent is RegisterEventPressed) {
      yield RegisterState.loading();
      try {
        await _userRepository.createUserWithEmailAndPassword(
            registerEvent.email,
            registerEvent.password
        );
        yield RegisterState.success();
      } catch (exception) {
        yield RegisterState.failure();
      }
    }
  }
}