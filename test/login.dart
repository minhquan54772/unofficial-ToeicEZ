import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:toeic/blocs/simple_bloc_observer.dart';

import '../lib/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("validate test drive ", (WidgetTester tester) async {
    final Finder signInEmailField = find.byKey(Key('signInEmailField'));
    final Finder signInPasswordField = find.byKey(Key('signInPasswordField'));
    final Finder signInSaveButton = find.byKey(Key('signInSaveButton'));
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    //Login without username and password
    await tester.tap(signInSaveButton);
    await tester.pumpAndSettle(Duration(seconds: 3));
    //Login validator email
    await tester.enterText(signInEmailField, "Ngminhquan.aries");
    await tester.tap(signInSaveButton);
    await tester.pumpAndSettle(Duration(seconds: 3));
    //Login without password
    await tester.enterText(signInEmailField, "Ngminhquan.aries@gmail.com");
    await tester.tap(signInSaveButton);
    await tester.pumpAndSettle(Duration(seconds: 3));
    //Login wrong password
    await tester.enterText(signInPasswordField, "123");
    await tester.pumpAndSettle(Duration(seconds: 1));
    //Login successful
    await tester.enterText(signInPasswordField, "123456");
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(signInSaveButton);
    await tester.pumpAndSettle(Duration(seconds: 10));
  });
}
