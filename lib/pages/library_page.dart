import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.library_books),
                    SizedBox(width: 10),
                    Text(
                      'Bài kiểm tra TOEIC đầy đủ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.mode_edit),
                    SizedBox(width: 10),
                    Text(
                      'Bài kiểm tra rút gọn',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.list),
                    SizedBox(width: 10),
                    Text(
                      'Luyện riêng từng phần',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.menu_book_outlined),
                    SizedBox(width: 10),
                    Text(
                      'Từ vựng',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.sort_by_alpha),
                    SizedBox(width: 10),
                    Text(
                      'Ngữ pháp',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.bubble_chart),
                    SizedBox(width: 10),
                    Text(
                      'Tip làm bài',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.white70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.history),
                    SizedBox(width: 10),
                    Text(
                      'Lịch sử',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
