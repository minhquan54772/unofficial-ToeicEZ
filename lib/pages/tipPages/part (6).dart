import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/tipPages/tip_content.dart';

class TipPart6 extends StatelessWidget {
  final String _title = 'Part 6: Điền vào đoạn văn';
  final PageController controller = PageController(initialPage: 0);
  static List _contentTitles = [];
  static List _contents = [];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('practiceTip')
        .doc(_title)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data();
        var temp = data.keys.toList();
        temp.sort();
        _contentTitles = temp.reversed.toList();
        for (var tit in _contentTitles) {
          _contents.add(data[tit]);
        }
      }
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
                onPressed: () {
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
            for (var i = 0; i < _contentTitles.length; i++)
              TipContent(
                contentTitle: _contentTitles[i],
                content: _contents[i],
              )
          ],
        ),
      ),
    );
  }
}
