import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';

import 'button/oneline_stretch_button.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    "assets/images/icons/icon_user.svg",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Someone Example',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 3.0)),
                      Text('GG: someone.example@gmail.com'),
                      Padding(padding: EdgeInsets.only(top: 3.0)),
                      Text(
                        'PREMIUM USER',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 5.0)),
                      Text(
                        'Coin: 0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  padding: EdgeInsets.only(left: 30.0),
                  color: Colors.redAccent,
                  onPressed: (){
                    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedOut());
                  },
                ),
              ],
            ),
            OneLineStretchButton(
              content: 'Kích hoạt tài khoản',
              icon: Icon(Icons.verified, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            OneLineStretchButton(
              content: 'Fanpage ToeicEZ',
              icon: Icon(FontAwesomeIcons.facebook, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            OneLineStretchButton(
              content: 'Đánh giá ứng dụng',
              icon: Icon(Icons.star, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            OneLineStretchButton(
              content: 'Chia sẻ cho bạn bè',
              icon: Icon(Icons.share, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            OneLineStretchButton(
              content: 'Giới thiệu',
              icon: Icon(Icons.info, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}