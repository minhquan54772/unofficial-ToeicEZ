import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2.0),
        child: ListView(
          children: <Widget>[
            progressPart("Phần 2", 40, 10, 0, 0),
            progressPart("Phần 3", 40, 13, 0, 0),
          ],
        ),
      ),
    );
  }

  InkWell progressPart(
      String _title, int _require, int _done, int _correct, int _wrong) {
    double _percent = _done / _require;
    String _percentText = (_percent * 100).toString() + '%';
    return InkWell(
      onTap: () {
        print("Progress " + _title + " part clicked");
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: [
              BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.2))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                _title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 1000,
                percent: _percent,
                center: Text(_percentText),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Số câu yêu cầu: ' + _require.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Số câu đã làm: ' + _done.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Làm đúng: ' + _correct.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Làm sai: ' + _wrong.toString(),
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
