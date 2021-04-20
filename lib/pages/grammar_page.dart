import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button/indexed_button.dart';
import 'grammarPages/basic_eight.dart';
import 'grammarPages/basic_eleven.dart';
import 'grammarPages/basic_five.dart';
import 'grammarPages/basic_four.dart';
import 'grammarPages/basic_nine.dart';
import 'grammarPages/basic_one.dart';
import 'grammarPages/basic_seven.dart';
import 'grammarPages/basic_six.dart';
import 'grammarPages/basic_ten.dart';
import 'grammarPages/basic_three.dart';
import 'grammarPages/basic_two.dart';

class GrammarPage extends StatelessWidget {
  final tab = TabBar(tabs: <Tab>[
    Tab(icon: Icon(Icons.arrow_forward)),
    Tab(icon: Icon(Icons.arrow_downward)),
    Tab(icon: Icon(Icons.arrow_back)),
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 20),
              tabs: [
                Tab(text: 'Thông dụng',),
                Tab(text: 'Cơ bản',),
              ],
            ),
            title: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_outlined),
                    padding: EdgeInsets.only(left: 10.0, right: 30.0),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Text('Ngữ pháp')
                ]
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                  child: SingleChildScrollView (
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                       IndexedButton(content: 'Cấu trúc chung của một câu', index: 1, page: () => BasicGrammarOne(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Noun phrase (Ngữ danh từ)', index: 2, page: () => BasicGrammarTwo(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Verb phrase (Ngữ động từ)', index: 3, page: () => BasicGrammarThree(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Sự hòa hợp giữa noun và verb', index: 4, page: () => BasicGrammarFour(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Đại từ', index: 5, page: () => BasicGrammarFive(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Tân ngữ và các vấn đề liên quan', index: 6, page: () => BasicGrammarSix(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Một số động từ đặc biệt', index: 7, page: () => BasicGrammarSeven(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Câu hỏi', index: 8, page: () => BasicGrammarEight(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Lối nói phụ họa', index: 9, page: () => BasicGrammarNine(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Câu phủ định (negation)', index: 10, page: () => BasicGrammarTen(),),
                       Padding(padding: EdgeInsets.only(top: 5)),
                       IndexedButton(content: 'Câu mệnh lệnh', index: 11, page: () => BasicGrammarEleven(),),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(0),
                child: SingleChildScrollView (
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      IndexedButton(content: 'Present simple', index: 1, page: () => BasicGrammarOne(),),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present continuous', index: 2),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present continuous and present simple(1)', index: 3),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present continuous and present simple(2)', index: 4),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Past simple', index: 5),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Past continuous', index: 6),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present perfect (1)', index: 7),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present perfect (2)', index: 8),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present continuous', index: 9),
                      Padding(padding: EdgeInsets.only(top: 5)),
                      IndexedButton(content: 'Present continuous and simple', index: 10),
                      
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}