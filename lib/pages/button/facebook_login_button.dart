import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toeic/blocs/login_bloc.dart';
import 'package:toeic/events/login_event.dart';

class FacebookLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 45,
      child: RaisedButton.icon(
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginEventWithFacebookPressed());
        },
        icon: Icon(FontAwesomeIcons.facebook, color: Colors.white, size: 17,),
        label: Text(
          'Signin with Facebook',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        color: Colors.blueAccent,
      ),
    );
  }
}