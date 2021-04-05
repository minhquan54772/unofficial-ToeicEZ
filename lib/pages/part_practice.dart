import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          ],
        ),
      )
    );
  }
}