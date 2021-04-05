import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicGrammarOne extends StatelessWidget {
  final String _title = 'Cấu trúc chung của một câu';

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
          body: Center(
            child: Text('Content here'),
          )
        ),
    );
  }
}