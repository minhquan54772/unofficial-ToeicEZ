import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OneLineStretchButton extends StatelessWidget {
  final content;
  final Icon icon;
  final Widget Function() page;
  final BuildContext context;
  final String url;

  //constructor
  OneLineStretchButton({@required content, icon, page, context, url})
      : this.content = content,
        this.icon = icon,
        this.page = page,
        this.context = context,
        this.url = url;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        child: ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          this.icon,
          Padding(padding: EdgeInsets.only(left: 10.0)),
          Text(
            '${this.content}',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.all(22),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      onPressed: () {
        if (page != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return page();
          }));
        } else if (url != null) {
          _launchURL(url);
        }
      },
    ));
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
