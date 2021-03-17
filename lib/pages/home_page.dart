import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curridx = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventLoggedOut());
              },
          )
        ],
      ),
      body: Center(
        child: Text('This is HomePage!', style: TextStyle(fontSize: 30, color: Colors.green),),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              iconBtnAppbar("assets/images/icons/icon_routine.svg", "Lộ trình học", 0),
              iconBtnAppbar("assets/images/icons/icon_library.svg", "Thư viện", 1),
              iconBtnAppbar("assets/images/icons/icon_notification.svg", "Bảng tin", 2),
              iconBtnAppbar("assets/images/icons/icon_profile.svg", "Tài khoản", 3),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector iconBtnAppbar(String iconpath, String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          curridx = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            iconpath,
            height: 30,
            color: curridx == index ? Colors.blueAccent : Colors.grey,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight:
                curridx == index ? FontWeight.w700 : FontWeight.w600,
                color: curridx == index ? Colors.blueAccent : Colors.grey
            ),
          )
        ],
      ),
    );
  }
}

