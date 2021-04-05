import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TwoLinesStretchButton extends StatelessWidget {
  final String title;
  final String content;
  final Icon icon;
  final Widget Function() page;

  //constructor
  TwoLinesStretchButton({@required title, content, icon, page}):
        this.title = title,
        this.content = content,
        this.icon = icon,
        this.page = page;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              this.icon,
              Padding(padding: EdgeInsets.only(left: 10.0)),
              Column(
               mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${this.title}',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text(
                    '${this.content}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          onPressed: (){
            if (page != null) {
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return page();
                  })
              );
            }
          },
        )
    );
  }
}