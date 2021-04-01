import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/temp/indexed_button.dart';

class PracticeTip extends StatefulWidget {
  @override
  _PracticeTipState createState() => _PracticeTipState();
}

class _PracticeTipState extends State<PracticeTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IndexedButton(content: 'Part 1: Mô tả hình ảnh', index: 1),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Part 2: Hỏi đáp', index: 2),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Part 3: Đoạn hội thoại', index: 3),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Part 4: Bài nói chuyện', index: 4),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Part 5: Điền vào chỗ trống', index: 5),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Part 6: Điền vào đoạn văn', index: 6),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Part 7: Đọc hiểu đoạn văn', index: 7),
          ],
        ),
      ),
    );
  }
}