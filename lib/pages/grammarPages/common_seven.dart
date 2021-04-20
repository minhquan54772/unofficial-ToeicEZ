import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonGrammarSeven extends StatelessWidget {
  final String _title = 'Present perfect (1)';
  static String content;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('basicGrammar')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        content = doc["content"];
      });
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
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text('${this._title}')
              ],
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Text(
                  '${content}'
              ),
            ),
          )
      ),
    );
  }
}