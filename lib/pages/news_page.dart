import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toeic/pages/button/news_button.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NewsButton(
              title: 'Phiên bản mới nhất 2.6.2',
              content: 'Bạn đang sử dụng phiên bản mới nhất',
              icon: Icon(Icons.info),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            NewsButton(
              title: 'Cập nhật để 2020 (đến ngày 05/05/2020)',
              content: 'Đã có đủ 10 đề ETS 2020 rồi các bạn nhé',
              icon: Icon(Icons.mode_outlined),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            NewsButton(
              title: 'Đánh giá ToeicEZ',
              content: 'Ý kiến phản hồi',
              icon: Icon(Icons.mode_outlined),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            NewsButton(
              title: 'Khuyến mại đặc biệt',
              content: 'Mua tài khoản VIP vĩnh viễn (giảm giá 60%)',
              icon: Icon(FontAwesomeIcons.tag),
            ),
          ],
        ),
      ),
    );
  }
}