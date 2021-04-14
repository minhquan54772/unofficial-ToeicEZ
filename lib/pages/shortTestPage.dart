import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShortTestPage extends StatefulWidget {
  @override
  _ShortTestPageState createState() => _ShortTestPageState();
}

class _ShortTestPageState extends State<ShortTestPage> {
  List _questions = [];

  Future<void> readJSON() async {
    final String resp =
        await rootBundle.loadString('assets/json/questions.json');
    final questions = await json.decode(resp);
    setState(() {
      _questions = questions['questions'];
    });
    print(_questions[1]['1']);
  }

  @override
  void initState() {
    super.initState();
    readJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Text('Bài kiểm tra rút gọn')],
          ),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: _questions.length ~/ 100,
                itemBuilder: (context, index) {
                  int min = 1;
                  int max = 3625;
                  var rnd = new Random();
                  index = min + rnd.nextInt(max - min);
                  return question(
                      _questions[index]['question'],
                      index + 1,
                      _questions[index]['1'],
                      _questions[index]['2'],
                      _questions[index]['3'],
                      _questions[index]['4']);
                })));
  }

  RadioListTile option(_option) {
    return RadioListTile(
      title: Text(_option),
      value: _option,
      groupValue: _option,
      onChanged: null,
    );
  }

  Container question(_question, _index, _opt1, _opt2, _opt3, _opt4) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.only(top: 10, right: 5, left: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Text(
              _index.toString() + ", " + _question,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ),
          option(_opt1),
          option(_opt2),
          option(_opt3),
          option(_opt4)
        ],
      ),
    );
  }
}
