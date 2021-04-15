// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:toeic/questionService/quiz.dart';
// import 'package:toeic/questionService/result.dart';
//
// class PartPracticeOne extends StatefulWidget {
//   @override
//   _PartPracticeState createState() => _PartPracticeState();
// }
//
// class _PartPracticeState extends State<PartPracticeOne> {
//   final _questions = const [
//     {
//       'questionText': 'Q1. Who created Flutter?',
//       'answers': [
//         {'text': 'Facebook', 'score': -2},
//         {'text': 'Adobe', 'score': -2},
//         {'text': 'Google', 'score': 10},
//         {'text': 'Microsoft', 'score': -2},
//       ],
//     },
//     {
//       'questionText': 'Q2. What is Flutter?',
//       'answers': [
//         {'text': 'Android Development Kit', 'score': -2},
//         {'text': 'IOS Development Kit', 'score': -2},
//         {'text': 'Web Development Kit', 'score': -2},
//         {
//           'text':
//           'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
//           'score': 10
//         },
//       ],
//     },
//   ];
//
//   var _totalScore = 0;
//   var _questionIndex = 0;
//
//   void _answerQuestion(int score) {
//     _totalScore += score;
//
//     setState(() {
//       _questionIndex = _questionIndex + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.arrow_back_outlined),
//                 padding: EdgeInsets.only(left: 10.0, right: 30.0),
//                 onPressed: (){
//                   Navigator.pop(context);
//                 },
//               ),
//               Text('Phan 1')
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: _questions.map<Widget>(
//                         (question) => Quiz(
//                           questions: _questions,
//                           answerQuestion: ,
//                           questionIndex: question,
//                         )
//               ).toList()
//           )
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }