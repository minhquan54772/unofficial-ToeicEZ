import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicGrammar8 extends StatelessWidget {
  final String _title = "Câu phủ định (negation)";
  static List _fieldname = [];
  static List _contents = [];

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('grammar')
        .doc(_title)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map data = documentSnapshot.data();
        var temp = data.keys.toList();
        temp.sort();
        _fieldname = temp.toList();
        print(_fieldname);
        for (var tit in _fieldname) {
          _contents.add(data[tit]);
        }
        print(_contents);
      }
    });
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  padding: EdgeInsets.only(left: 10.0, right: 30.0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('${this._title}')
              ],
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  for (var i = 0; i < _fieldname.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _fieldname[i],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            _contents[i],
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
