import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class Answer extends StatefulWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  // final Function selectHandler;
  // final String answerText;
  //
  // _AnswerState(this.selectHandler, this.answerText);

  String value = 'flutter';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String>.single(
        title: 'Frameworks',
        value: value,
        choiceItems: options,
        onChange: (state) => setState(() => value = state.value)
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     child: RaisedButton(
  //       color: Color(0xFF00E676),
  //       textColor: Colors.white,
  //       child: Text(answerText),
  //       onPressed: selectHandler,
  //     ), //RaisedButton
  //   ); //Container
  // }
}
