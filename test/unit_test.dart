// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:toeic/main.dart';
import 'package:toeic/pages/home_page.dart';
import 'package:toeic/pages/library_page.dart';

void main(){
  Widget createWidgetForTesting({Widget child}){
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('Button test', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Bài kiểm tra TOEIC đầy đủ'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Bài kiểm tra rút gọn'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Luyện riêng từng phần'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Từ vựng'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Ngữ pháp'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Tip làm bài'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.pumpWidget(createWidgetForTesting(child: new LibraryPage()));

    expect(find.text('Lịch sử'), findsOneWidget);

    await tester.pumpAndSettle();
    {
      var button = find.text("Bài kiểm tra TOEIC đầy đủ");
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pump();
    }
    {
      var button = find.text("Ngữ pháp");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    }
    {
      var button = find.text("Từ vựng");
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pump();
    }
    {
      var button = find.text("Tip làm bài");
      expect(button, findsOneWidget);
      await tester.tap(button);
      await tester.pump();
    }

  }


  );

}



