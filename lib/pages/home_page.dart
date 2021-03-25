import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';
import 'package:toeic/pages/library_page.dart';

import 'package:toeic/temp/iPhone12ProMax1.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Lộ trình học',
      style: TextStyle(fontSize: 30),
    ),
    LibraryPage(),
    Text(
      'Index 2: Bảng tin',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'Index 3: Tài khoản',
      style: TextStyle(fontSize: 30),
    ),
  ];

  static List<Widget> _titleOptions = <Widget>[
    Text(
      'LỘ TRÌNH HỌC',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'THƯ VIỆN',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'BẢNG TIN',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    Text(
      'TÀI KHOẢN',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: _titleOptions[_selectedIndex],
        centerTitle: true,
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
        // child: Text('This is HomePage!', style: TextStyle(fontSize: 30, color: Colors.green),),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/images/icons/icon_routine.svg",
                color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Lộ trình học',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/icon_library.svg",
              color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Thư viện',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/icon_notification.svg",
              color: _selectedIndex == 2 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Bảng tin',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/icons/icon_profile.svg",
              color: _selectedIndex == 3 ? Colors.blueAccent : Colors.grey,
            ),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

