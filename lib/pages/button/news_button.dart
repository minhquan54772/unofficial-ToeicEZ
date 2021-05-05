import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsButton extends StatelessWidget {
  final String title;
  final String content;
  final Icon icon;

  //constructor
  NewsButton({@required title, content, icon})
      : this.title = title,
        this.content = content,
        this.icon = icon;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        height: 50.0,
        child: ElevatedButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  this.icon,
                  SizedBox(width: 10),
                  Text(
                    '${this.title}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                '${this.content}',
                style: TextStyle(color: Colors.black38),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          onPressed: () {},
        ));
  }
}
