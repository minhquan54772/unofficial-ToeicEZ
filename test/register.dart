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
    final Finder registerEmailField = find.byKey(Key('registerEmailField'));
    final Finder registerPasswordField = find.byKey(Key('registerPasswordField'));
    final Finder registerSaveButton = find.byKey(Key('registerSaveButton'));
    final Finder signInRegisterButton = find.byKey(Key('signInRegisterButton'));
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = SimpleBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    await tester.tap(signInRegisterButton);
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.enterText(registerEmailField, "Ngminhquan.aries@gmail.com");
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.enterText(registerEmailField, "Ngminhquan.aries@gmail.com");
    await tester.enterText(registerPasswordField, "123456");
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.tap(registerSaveButton);
    await tester.pumpAndSettle(Duration(seconds: 10));
  });
}
