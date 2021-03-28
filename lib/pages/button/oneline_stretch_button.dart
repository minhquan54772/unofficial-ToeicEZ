import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneLineStretchButton extends StatelessWidget {
  final String content;
  final Icon icon;

  //constructor
  OneLineStretchButton({@required content, icon}):
        this.content = content,
        this.icon = icon;

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
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          onPressed: (){},
        )
    );
  }
}