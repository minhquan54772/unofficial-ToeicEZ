import 'package:flutter/material.dart';
import 'package:toeic/repositories/user_repository.dart';
import 'LoginPage.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final userRepository = UserRepository();
    userRepository.createUserWithEmailAndPassword("xuanphu213@gmail.com", "123456");
    return MaterialApp(
      title: 'ToeicEZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

