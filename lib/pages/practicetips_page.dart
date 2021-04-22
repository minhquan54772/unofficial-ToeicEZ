import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/button/indexed_button.dart';
import 'package:toeic/pages/tipPages/part (1).dart';
import 'package:toeic/pages/tipPages/part (2).dart';
import 'package:toeic/pages/tipPages/part (3).dart';
import 'package:toeic/pages/tipPages/part (4).dart';
import 'package:toeic/pages/tipPages/part (5).dart';
import 'package:toeic/pages/tipPages/part (6).dart';
import 'package:toeic/pages/tipPages/part (7).dart';

class PracticeTipPage extends StatefulWidget {
  @override
  _PracticeTipPageState createState() => _PracticeTipPageState();
}

class _PracticeTipPageState extends State<PracticeTipPage> {
  static List parts = [
    'Part 1: Mô tả hình ảnh',
    'Part 2: Hỏi đáp',
    'Part 3: Đoạn hội thoại',
    'Part 4: Bài nói chuyện',
    'Part 5: Điền vào chỗ trống',
    'Part 6: Điền vào đoạn văn',
    'Part 7: Đọc hiểu đoạn văn'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text('Tip làm bài')],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IndexedButton(
              content: parts[0],
              index: 1,
              page: () => TipPart1(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[1],
              index: 2,
              page: () => TipPart2(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[2],
              index: 3,
              page: () => TipPart3(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[3],
              index: 4,
              page: () => TipPart4(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[4],
              index: 5,
              page: () => TipPart5(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[5],
              index: 6,
              page: () => TipPart6(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[6],
              index: 7,
              page: () => TipPart7(),
            ),
          ],
        ),
      ),
    );
  }
}
