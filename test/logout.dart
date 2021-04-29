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
    // final Finder signInEmailField = find.byKey(Key('signInEmailField'));
    // final Finder signInPasswordField = find.byKey(Key('signInPasswordField'));
    // final Finder signInSaveButton = find.byKey(Key('signInSaveButton'));
    final Finder homePageAccountTab = find.byKey(Key('homePageAccountTab'));
    final Finder accountPageLogoutButton = find.byKey(Key('accountPageLogoutButton'));

    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    //Login
    // await tester.enterText(signInEmailField, "Ngminhquan.aries@gmail.com");
    // await tester.pumpAndSettle(Duration(seconds: 3));
    // await tester.enterText(signInPasswordField, "123");
    // await tester.pumpAndSettle(Duration(seconds: 3));
    // await tester.enterText(signInPasswordField, "123456");
    // await tester.pumpAndSettle(Duration(seconds: 10));
    // await tester.tap(signInSaveButton);
    // await tester.pump(Duration(seconds: 30));
    //Logout
    await tester.tap(homePageAccountTab);
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(accountPageLogoutButton);
    await tester.pumpAndSettle(Duration(seconds: 10));
  });
}
