import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/button/indexed_button.dart';
import 'package:toeic/pages/grammarPages/basic (1).dart';
import 'package:toeic/pages/grammarPages/basic (2).dart';
import 'package:toeic/pages/grammarPages/basic (3).dart';
import 'package:toeic/pages/grammarPages/basic (4).dart';
import 'package:toeic/pages/grammarPages/basic (5).dart';
import 'package:toeic/pages/grammarPages/basic (6).dart';
import 'package:toeic/pages/grammarPages/basic (7).dart';
import 'package:toeic/pages/grammarPages/basic (8).dart';

class GrammarPage extends StatefulWidget {
  @override
  _GrammarPageState createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text('Ngữ pháp')],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IndexedButton(
                content: 'Cấu trúc chung của một câu',
                index: 1,
                page: () => BasicGrammarOne(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Noun phrase (Ngữ danh từ)',
                index: 2,
                page: () => BasicGrammarTwo(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Verb phrase (Ngữ động từ)',
                index: 3,
                page: () => BasicGrammar3(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Sự hòa hợp giữa chủ ngữ và động từ',
                index: 4,
                page: () => BasicGrammar4(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Đại từ',
                index: 5,
                page: () => BasicGrammar5(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Tân ngữ và các vấn đề liên quan',
                index: 6,
                page: () => BasicGrammar6(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Một số động từ đặc biệt (need,dare,to be,get)',
                index: 7,
                page: () => BasicGrammar7(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(
                content: 'Câu phủ định (negation)',
                index: 8,
                page: () => BasicGrammar8(),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(content: 'Lối nói phụ họa', index: 9),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(content: 'Câu hỏi', index: 10),
              Padding(padding: EdgeInsets.only(top: 5)),
              IndexedButton(content: 'Câu mệnh lệnh', index: 11),
            ],
          ),
        ),
      ),
    );
  }
}
