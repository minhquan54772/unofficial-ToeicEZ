import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/button/twolines_stretch_button.dart';
import 'package:toeic/pages/partPractice/part_practice_one.dart';

class PartPractice extends StatefulWidget {
  @override
  _PartPracticeState createState() => _PartPracticeState();
}

class _PartPracticeState extends State<PartPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LUYỆN RIÊNG TỪNG PHẦN')
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 1',
              content: 'Mô tả tranh',
              icon: Icon(Icons.image, color: Colors.black,),
              // page: () => PartPracticeOne(),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 2',
              content: 'Hỏi và trả lời',
              icon: Icon(Icons.question_answer_rounded, color: Colors.black,),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 3',
              content: 'Hội thoại ngắn',
              icon: Icon(Icons.question_answer_outlined, color: Colors.black,),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 4',
              content: 'Bài nói ngắn',
              icon: Icon(Icons.wysiwyg, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 5',
              content: 'Hoàn thành câu',
              icon: Icon(Icons.widgets, color: Colors.black,),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 6',
              content: 'Hoàn thành đoạn văn',
              icon: Icon(Icons.article, color: Colors.black,),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            TwoLinesStretchButton(
              title: 'Phần 7',
              content: 'Đọc hiểu (gồm 1 hoặc nhiều đoạn văn)',
              icon: Icon(Icons.menu_book, color: Colors.black,),
            ),
          ],
        ),
      )
    );
  }
}