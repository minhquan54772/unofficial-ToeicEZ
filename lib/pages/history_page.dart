import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final tab = TabBar(tabs: <Tab>[
    Tab(icon: Icon(Icons.arrow_forward)),
    Tab(icon: Icon(Icons.arrow_downward)),
    Tab(icon: Icon(Icons.arrow_back)),
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.history), text: 'Các phần',),
                Tab(icon: Icon(Icons.library_books), text: 'Đề thi',),
                Tab(icon: Icon(Icons.star_border), text: 'Đánh dấu',),
              ],
            ),
            title: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  padding: EdgeInsets.only(left: 10.0, right: 30.0),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text('Lịch sử')
              ]
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.history),
              Icon(Icons.library_books),
              Icon(Icons.star_border),
            ],
          ),
        ),
      ),
    );
  }
}