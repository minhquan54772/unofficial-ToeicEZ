import 'package:flutter/cupertino.dart';

class TipContent extends StatelessWidget {
  final String _contentTitle;
  final String _content;

  TipContent({contentTitle, content})
      : this._contentTitle = contentTitle,
        this._content = content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${this._contentTitle}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${this._content}',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
