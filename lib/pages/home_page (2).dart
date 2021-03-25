import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:toeic/temp/iPhone12ProMax1.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Lộ trình học',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 1: Thư viện',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 2: Bảng tin',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Index 3: Tài khoản',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
        leading: IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {},
        ),
        title: Text('LỘ TRÌNH HỌC', textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationEventLoggedOut());
            },
          )
        ],
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          progressPart('Phần 2', 40, 10, 10, 0),
          progressPart('Phần 3', 40, 20, 20, 0),
        ],
      )),
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

  Container progressPart(
      String _title, int _require, int _done, int _correct, int _wrong) {
    double _percent = _done / _require;
    String _percentText = (_percent * 100).toString() + '%';
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.2))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              _title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 1000,
              percent: _percent,
              center: Text(_percentText),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              'Số câu yêu cầu: ' + _require.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              'Số câu đã làm: ' + _done.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              'Làm đúng: ' + _correct.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              'Làm sai: ' + _wrong.toString(),
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
