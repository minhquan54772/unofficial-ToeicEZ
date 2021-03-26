import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';

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
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.verified),
                    SizedBox(width: 10),
                    Text(
                      'Kích hoạt tài khoản',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.facebook),
                    SizedBox(width: 10),
                    Text(
                      'Fanpage ToeicEZ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.star),
                    SizedBox(width: 10),
                    Text(
                      'Đánh giá ứng dụng',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.share),
                    SizedBox(width: 10),
                    Text(
                      'Chia sẻ cho bạn bè',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.info),
                    SizedBox(width: 10),
                    Text(
                      'Giới thiệu',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}