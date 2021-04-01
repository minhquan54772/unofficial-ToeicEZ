import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OneLineStretchButton extends StatelessWidget {
  final String content;
  final Icon icon;
  final Widget Function() page;
  final BuildContext context;

  //constructor
  OneLineStretchButton({@required content, icon, page, context}):
        this.content = content,
        this.icon = icon,
        this.page = page,
        this.context = context;

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