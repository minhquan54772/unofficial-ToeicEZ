import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toeic/blocs/login_bloc.dart';
import 'package:toeic/events/login_event.dart';
import 'package:toeic/pages/button/oneline_stretch_button.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).add(LoginEventWithGooglePressed());
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(FontAwesomeIcons.google),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Sign in with Google",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
