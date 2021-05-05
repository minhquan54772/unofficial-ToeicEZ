// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

import 'package:toeic/main.dart' as app;

class FirebaseUserMock extends Mock implements User {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class GoogleSignInMock extends Mock implements GoogleSignIn {}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}

class UserCredentialMock extends Mock implements UserCredential {}

class GoogleSignInAuthenticationMock extends Mock
    implements GoogleSignInAuthentication {}

void main() {
  app.main();
  group('Auth', () {
    final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock();
    final GoogleSignInMock googleSignInMock = GoogleSignInMock();
    final UserCredentialMock userCredentialMock = UserCredentialMock();
    final GoogleSignInAccountMock googleSignInAccountMock =
    GoogleSignInAccountMock();
    final GoogleSignInAuthenticationMock googleSignInAuthenticationMock =
    GoogleSignInAuthenticationMock();

    test('signInWithGoogle returns a user', () async {
      when(googleSignInMock.signIn()).thenAnswer((_) =>
      Future<GoogleSignInAccountMock>.value(googleSignInAccountMock));

      when(googleSignInAccountMock.authentication).thenAnswer((_) =>
      Future<GoogleSignInAuthenticationMock>.value(
          googleSignInAuthenticationMock));

      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthenticationMock.idToken,
          accessToken: googleSignInAuthenticationMock.accessToken);

      when(firebaseAuthMock.signInWithCredential(authCredential)).thenAnswer(
              (_) => Future<UserCredentialMock>.value(userCredentialMock));

      verify(googleSignInMock.signIn()).called(1);
      verify(googleSignInAccountMock.authentication).called(1);
      verify(firebaseAuthMock.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleSignInAuthenticationMock.idToken,
              accessToken: googleSignInAuthenticationMock.accessToken)))
          .called(1);
    });
  });
}
