import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/tipPages/tip_content.dart';

class TipPartOne extends StatelessWidget {
  final String _title = 'Part 1: Mô tả hình ảnh';
  final PageController controller = PageController(initialPage: 0);
  static String _titleContent;
  static String _content;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('practiceTip')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _titleContent = doc["titleContent"];
        _content = doc["content"];
      });
    });
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  padding: EdgeInsets.only(left: 10.0, right: 30.0),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text('${this._title}')
              ],
            ),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: <Widget>[
            TipContent(
              titleContent: _titleContent,
              content: _content,
            ),
            Center(
              child: Text('Second Page'),
            ),
            Center(
              child: Text('Third Page'),
            )
          ],
        ),
      ),
    );
  }
}