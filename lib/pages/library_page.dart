import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toeic/pages/button/oneline_stretch_button.dart';
import 'package:toeic/pages/grammar_page.dart';
import 'package:toeic/pages/history_page.dart';
import 'package:toeic/pages/part_practice.dart';
import 'package:toeic/pages/practicetips_page.dart';
import 'package:toeic/pages/shortTestPage.dart';
import 'package:toeic/pages/vocabPage.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<LibraryPage> {
  List _questions = [];

  Future<void> readJSON() async {
    final String resp =
        await rootBundle.loadString('assets/json/questions.json');
    final questions = await json.decode(resp);
    setState(() {
      _questions = questions['questions'];
    });
  }

  @override
  void initState() {
    super.initState();
    readJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OneLineStretchButton(
              content: 'Bài kiểm tra TOEIC đầy đủ',
              icon: Icon(Icons.library_books, color: Colors.black),
            ),
            SizedBox(height: 10),
            OneLineStretchButton(
              content: 'Bài kiểm tra rút gọn',
              icon: Icon(Icons.mode_edit, color: Colors.black),
              page: () => ShortTestPage(questions: _questions),
            ),
            SizedBox(height: 10),
            OneLineStretchButton(
              content: 'Luyện riêng từng phần',
              icon: Icon(Icons.list, color: Colors.black),
              page: () => PartPractice(),
            ),
            SizedBox(height: 10),
            OneLineStretchButton(
              content: 'Từ vựng',
              icon: Icon(Icons.menu_book_outlined, color: Colors.black),
              page: () => VocabPage(),
            ),
            SizedBox(height: 10),
            OneLineStretchButton(
              content: 'Ngữ pháp',
              icon: Icon(Icons.sort_by_alpha, color: Colors.black),
              page: () => GrammarPage(),
            ),
            SizedBox(height: 10),
            OneLineStretchButton(
              content: 'Tip làm bài',
              icon: Icon(Icons.bubble_chart, color: Colors.black),
              page: () => PracticeTipPage(),
            ),
            SizedBox(height: 10),
            OneLineStretchButton(
              content: 'Lịch sử',
              icon: Icon(Icons.history, color: Colors.black),
              page: () => HistoryPage(),
            ),
          ],
        ),
      ),
    );
  }
}
