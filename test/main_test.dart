import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';
import 'package:toeic/main.dart' as app;
import 'package:toeic/repositories/user_repository.dart';
import 'package:toeic/states/authentication_state.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class FirebaseUserMock extends Mock implements User {}

class MockAuthenticationBloc extends Mock implements AuthenticationBloc {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  app.main();

  AuthenticationBloc authenticationBloc;
  MockUserRepository userRepository;
  FirebaseUserMock user = new FirebaseUserMock();

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  });

  group("render ui by state", () {
    test('initial state is correct', () {
      expect(authenticationBloc.state, AuthenticationStateInitial());
    });

    test('close does not emit new states', () {
      expectLater(
        authenticationBloc,
        emitsInOrder([AuthenticationStateInitial(), emitsDone]),
      );
      authenticationBloc.close();
    });
  });

  group('AppStarted', () {
    test('emits [AuthenticationEventStarted] for invalid token', () {
      final expectedResponse = [AuthenticationStateFailure()];

      when(userRepository.isSignedIn()).thenAnswer((_) => Future.value(false));

      expectLater(
        authenticationBloc,
        emitsInOrder(expectedResponse),
      );
      authenticationBloc.add(AuthenticationEventStarted());
    });
  });

  group('LoggedIn', () {
    test('emits [authenticated] when token is persisted', () {
      final expectedResponse = [
        AuthenticationStateSuccess(),
      ];

      when(userRepository.getUser()).thenAnswer((_) => Future.value(user));

      expectLater(
        authenticationBloc,
        emitsInOrder(expectedResponse),
      );

      authenticationBloc.add(AuthenticationEventLoggedIn());
    });
  });
}
