import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toeic/pages/button/twolines_stretch_button.dart';

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
            TwoLinesStretchButton(
              title: 'Phần 1',
              content: 'Mô tả tranh',
              icon: Icon(Icons.image, color: Colors.black,),
            ),
            SizedBox(height: 10),
            TwoLinesStretchButton(
              title: 'Phần 2',
              content: 'Hỏi và trả lời',
              icon: Icon(FontAwesomeIcons.question, color: Colors.black,),
            ),
            SizedBox(height: 10),
            TwoLinesStretchButton(
              title: 'Phần 3',
              content: 'Hội thoại ngắn',
              icon: Icon(Icons.question_answer, color: Colors.black,),
            ),
            SizedBox(height: 10),
            TwoLinesStretchButton(
              title: 'Phần 4',
              content: 'Bài nói ngắn',
              icon: Icon(FontAwesomeIcons.teamspeak, color: Colors.black,),
            ),
            SizedBox(height: 10),
            TwoLinesStretchButton(
              title: 'Phần 5',
              content: 'Hoàn thành câu',
              icon: Icon(FontAwesomeIcons.pencilAlt, color: Colors.black,),
            ),
            SizedBox(height: 10),
            TwoLinesStretchButton(
              title: 'Phần 6',
              content: 'Hoàn thành đoạn văn',
              icon: Icon(FontAwesomeIcons.bookOpen, color: Colors.black,),
            ),
            SizedBox(height: 10),
            TwoLinesStretchButton(
              title: 'Phần 7',
              content: 'Đọc hiểu (gồm 1 hoặc nhiều đoạn văn)',
              icon: Icon(Icons.mark_chat_read, color: Colors.black,),
            ),
          ],
        ),
      )
    );
  }
}