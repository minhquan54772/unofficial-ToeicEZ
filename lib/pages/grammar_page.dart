import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/temp/indexed_button.dart';
import 'package:toeic/temp/grammar_button.dart';
class Grammar extends StatefulWidget {
  @override
  _GrammarState createState() => _GrammarState();
}

class _GrammarState extends State<Grammar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
          child: SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            IndexedButton(content: 'Cấu trúc chung của một câu', index: 1),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Noun phrase (Ngữ danh từ)', index: 2),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Verb phrase (Ngữ động từ)', index: 3),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Sự hòa hợp giữa chủ ngữ và động từ', index: 4),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Đại từ', index: 5),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Tân ngữ (complement/object) và các vấn đề liên quan', index: 6),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Một số động từ đặc biệt (need,dare,to be,get)', index: 7),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Câu hỏi', index: 8),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Lối nói phụ họa', index: 9),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Câu phủ định (negation)', index: 10),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Câu mệnh lệnh', index: 11),
          ],
        ),
        ),
      ),
    );
  }
}