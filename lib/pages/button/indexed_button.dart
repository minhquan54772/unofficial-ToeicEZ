import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexedButton extends StatelessWidget {
  final String content;
  final int index;

  IndexedButton({@required content, index}):
      this.content = content,
      this.index = index;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ButtonTheme(

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,

          ),
          child: Row(
           children:<Widget>[
             Padding(
               padding: EdgeInsets.only(top: 8, bottom: 5, right: 8),
               child: Container(

                 padding: EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(8)),
                   color: Colors.grey,
                 ),
                 child: Text('${index}'),
               ),
             ),
             Text('${content}',style: TextStyle(color: Colors.black),)
           ],
          ),
          onPressed: (){},
        ),
    );
  }
}