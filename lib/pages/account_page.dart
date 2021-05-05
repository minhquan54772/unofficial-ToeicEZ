import 'package:cloud_firestore/cloud_firestore.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  String displayName;
  String email;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    super.initState();
    getDataFromFb();
  }

  Future<void> getDataFromFb() async {
    User user = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('userData')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          if (doc.id == user.uid) {
            this.displayName = doc['DisplayName'];
            this.email = doc['Email'];
          }
        });
      });
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    FontAwesomeIcons.userCircle,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          '${this.displayName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text('GG: ${this.email}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          'PREMIUM USER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              // color: Colors.blueAccent,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          'Coin: 0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  padding: EdgeInsets.only(left: 30.0),
                  color: Colors.redAccent,
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthenticationEventLoggedOut());
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OneLineStretchButton(
                content: 'Kích hoạt tài khoản',
                icon: Icon(Icons.verified, color: Colors.cyan),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OneLineStretchButton(
                content: 'Fanpage ToeicEZ',
                icon: Icon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
                url: 'https://www.facebook.com/toeicez/',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OneLineStretchButton(
                content: 'Đánh giá ứng dụng',
                icon: Icon(Icons.star, color: Colors.yellow.shade700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OneLineStretchButton(
                content: 'Chia sẻ cho bạn bè',
                icon: Icon(Icons.share, color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OneLineStretchButton(
                content: 'Giới thiệu',
                icon: Icon(Icons.info, color: Colors.red),
                url: 'https://www.facebook.com/toeicez/',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
