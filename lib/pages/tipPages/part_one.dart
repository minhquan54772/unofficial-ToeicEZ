import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/pages/tipPages/tip_content.dart';

class TipPartOne extends StatelessWidget {
  final String _title = 'This is title';
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
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
              titleContent: 'Tổng quan:',
              content: 'Part 1 gồm 6 câu hỏi (từ câu 1 - 6), tương ứng với 6 hình ảnh, mỗi hình ảnh có 4 đáp án A, B, C, D để bạn lựa chọn',
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