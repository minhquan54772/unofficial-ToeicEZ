import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toeic/blocs/authentication_bloc.dart';
import 'package:toeic/events/authentication_event.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          alignment: Alignment.topLeft,
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              iconBtnAppbar(
                  "assets/images/icons/icon_routine.svg", "Lộ trình học", 0),
              iconBtnAppbar(
                  "assets/images/icons/icon_library.svg", "Thư viện", 1),
              iconBtnAppbar(
                  "assets/images/icons/icon_notification.svg", "Bảng tin", 2),
              iconBtnAppbar(
                  "assets/images/icons/icon_profile.svg", "Tài khoản", 3),
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
            height: 25,
            color: curridx == index ? Colors.blueAccent : Colors.grey,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                fontWeight:
                    curridx == index ? FontWeight.w700 : FontWeight.w600,
                color: curridx == index ? Colors.blueAccent : Colors.grey),
          )
        ],
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
