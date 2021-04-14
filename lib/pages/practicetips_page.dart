import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/button/indexed_button.dart';
import 'package:toeic/pages/tipPages/part_one.dart';
import 'package:toeic/pages/tipPages/part_two.dart';

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
    FirebaseFirestore.instance
        .collection('practiceTip')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        parts[doc['index']] = doc.id;
      });
    });

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
              page: () => TipPartOne(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(
              content: parts[1],
              index: 2,
              page: () => TipPart2(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: parts[2], index: 3),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: parts[3], index: 4),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: parts[4], index: 5),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: parts[5], index: 6),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: parts[6], index: 7),
          ],
        ),
      ),
    );
  }
}
