import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/button/indexed_button.dart';
import 'package:toeic/pages/grammarPages/basic_one.dart';
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
          children: [
            Text('Ngữ pháp')
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
          child: SingleChildScrollView (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            IndexedButton(content: 'Cấu trúc chung của một câu', index: 1, page: () => BasicGrammarOne(),),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Noun phrase (Ngữ danh từ)', index: 2),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Verb phrase (Ngữ động từ)', index: 3),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Sự hòa hợp giữa chủ ngữ và động từ', index: 4),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Đại từ', index: 5),
            Padding(padding: EdgeInsets.only(top: 5)),
            IndexedButton(content: 'Tân ngữ và các vấn đề liên quan', index: 6),
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