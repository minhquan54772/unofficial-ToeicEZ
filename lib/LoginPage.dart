import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 232,
                height: 232,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Toeicez.png'),
                      fit: BoxFit.fitWidth),
                )
              ),
              Text(
                'Learn TOEIC your own pace',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(144, 137, 137, 1),
                    fontFamily: 'Roboto',
                    fontSize: 19,
                    letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),
              ),
              Container(
                width: 350,
                height: 60,
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(15),
                        child: SvgPicture.asset('assets/images/fb_vector.svg', semanticsLabel: 'vector')
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Sign in with Facebook',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          fontFamily: 'Roboto',
                          fontSize: 19,
                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                      )
                    )
                  ]
                ),
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
                )
              ),
            Container(
                width: 350,
                height: 60,
                child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(15),
                          child:  Container(
                              width: 35.16279220581055,
                              height: 36,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/google.png'),
                                    fit: BoxFit.fitWidth),
                              )
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.all(15),
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
                          )
                      )
                    ]
                ),
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
                )),
            ],
          ),
        )
    );
  }
}