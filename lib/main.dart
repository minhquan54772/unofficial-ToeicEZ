import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToeicEZ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 768,
        height: 1024,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 492,
              left: 27,
              child: Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(34, 79, 146, 1),
                  ))),
          Positioned(
              top: 564,
              left: 27,
              child: Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
              top: 513,
              left: 128,
              child: Text(
                'Sign in with Facebook',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(179, 179, 179, 1),
                    fontFamily: 'Roboto',
                    fontSize: 19,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 584,
              left: 128,
              child: Text(
                'Sign in with Google',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(179, 179, 179, 1),
                    fontFamily: 'Roboto',
                    fontSize: 19,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 504,
              left: 52,
              child: SvgPicture.asset('assets/images/fb_vector.svg',
                  semanticsLabel: 'vector')),
          Positioned(
              top: 576,
              left: 52,
              child: Container(
                  width: 35.16279220581055,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/google.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 122,
              left: 90,
              child: Container(
                  width: 232,
                  height: 232,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Toeicez.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          Positioned(
              top: 361,
              left: 90,
              child: Text(
                'Learn TOEIC your own pace',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(144, 137, 137, 1),
                    fontFamily: 'Roboto',
                    fontSize: 19,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ]));
  }
}
