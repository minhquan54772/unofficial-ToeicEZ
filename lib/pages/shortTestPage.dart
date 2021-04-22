import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:toeic/pages/shortTestResult.dart';

class Question {
  String question, option1, option2, option3, option4, answer;
  int index;
  Question(
      {this.index,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.option4,
      this.answer});
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['questions']['index']['question'],
      option1: json['questions']['index']['1'],
      option2: json['questions']['index']['2'],
      option3: json['questions']['index']['3'],
      option4: json['questions']['index']['4'],
      answer: json['questions']['index']['answer'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'answer': answer
    };
  }
}

class getJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString('assets/json/questions.json'),
      builder: (context, snapshot) {
        var resp = json.decode(snapshot.data.toString());
        List questions = resp['questions'];

        if (questions == null) {
          return CircularProgressIndicator();
        } else {
          return ShortTestPage(
            questions: questions,
          );
        }
      },
    );
  }
}

class ShortTestPage extends StatefulWidget {
  final List questions;
  ShortTestPage({this.questions});
  @override
  State<StatefulWidget> createState() => _ShortTestPageState();
}

class _ShortTestPageState extends State<ShortTestPage> {
  int _correct = 0;
  int _wrong = 0;
  int _chosen = 0;
  int _total = 40;
  int index = 0;

  List _answers = [];
  bool _isButtonDisabled;
  Color right = Colors.green;
  Color wrong = Colors.red;

  @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;
  }

  Future finish() {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TestResult(
                  correct: _correct,
                  wrong: _wrong,
                  chosen: _chosen,
                  total: _total,
                  answers: _answers,
                )));
  }

  Map<String, dynamic> btnColor = {
    "1": Colors.white,
    "2": Colors.white,
    "3": Colors.white,
    "4": Colors.white,
  };

  void nextQuestion() {
    setState(() {
      _isButtonDisabled = false;
      if (index < _total - 1) {
        index = index + 1;
      }
    });
    if (index + 1 == _total) {
      Future.delayed(Duration(seconds: 3), finish);
    }
  }

  checkAnswer(String key) {
    setState(() {
      _isButtonDisabled = true;
      _chosen = _chosen + 1;
      _answers.add(widget.questions[index]['answer']);
      print(_answers);
      if (key == widget.questions[index]['answer']) {
        _correct += 1;
        btnColor[key] = right;
      } else {
        if (widget.questions[index]["1"] == widget.questions[index]['answer']) {
          btnColor[widget.questions[index]["1"]] = right;
        }
        if (widget.questions[index]["2"] == widget.questions[index]['answer']) {
          btnColor[widget.questions[index]["2"]] = right;
        }

        if (widget.questions[index]["3"] == widget.questions[index]['answer']) {
          btnColor[widget.questions[index]["3"]] = right;
        }

        if (widget.questions[index]["4"] == widget.questions[index]['answer']) {
          btnColor[widget.questions[index]["4"]] = right;
        }
        _wrong += 1;
        btnColor[key] = wrong;
      }
      return Timer(Duration(seconds: 1), nextQuestion);
    });
  }

  Widget option(String option) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          _isButtonDisabled ? null : checkAnswer(option);
        },
        child: Container(
          child: Text(
            option,
            style: TextStyle(fontSize: 22),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(15.0),
              color: btnColor[option]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bài kiểm tra rút gọn"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.questions[index]['question'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              option(widget.questions[index]['1']),
              option(widget.questions[index]['2']),
              option(widget.questions[index]['3']),
              option(widget.questions[index]['4']),
              Expanded(
                flex: 1,
                child: Text(""),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: LinearPercentIndicator(
                  percent: (index + 1) / _total,
                  animation: true,
                  width: MediaQuery.of(context).size.width * 0.5,
                  lineHeight: 20,
                  animationDuration: 100,
                  progressColor: Colors.green,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  center: Text("Question ${index + 1} / $_total"),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: finish, label: Text("Nộp bài")));
  }
}
