import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/button/indexed_button.dart';
import 'package:toeic/pages/tipPages/tip_part_one.dart';

class PracticeTipPage extends StatefulWidget {
  @override
  _PracticeTipPageState createState() => _PracticeTipPageState();
}

class _PracticeTipPageState extends State<PracticeTipPage> {
  static List parts = ['', '', '', '', '', '', '', '', '', ''];
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
          children: [
            Text('Tip làm bài')
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            IndexedButton(content: parts[1], index: 1, page: () => TipPartOne(),),
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