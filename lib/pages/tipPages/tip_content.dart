import 'package:flutter/cupertino.dart';

class TipContent extends StatelessWidget {
  final String _titleContent;
  final String _content;

  TipContent({titleContent, content}):
      this._titleContent = titleContent,
      this._content = content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${this._titleContent}', style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        Text('${this._content}'),
      ],
    );
  }
}