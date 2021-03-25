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
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.library_books),
                label: Text(
                  'Bài kiểm tra TOEIC đầy đủ',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.wysiwyg),
                label: Text(
                  'Bài kiểm tra rút gọn',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.list),
                label: Text(
                  'Luyện riêng từng phần',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.menu_book_outlined),
                label: Text(
                  'Từ vựng',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.sort_by_alpha),
                label: Text(
                  'Ngữ pháp',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.bubble_chart),
                label: Text(
                  'Tip làm bài',
                  style: TextStyle(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              height: 50,
              child: RaisedButton.icon(
                onPressed: (){},
                color: Colors.white70,
                icon: Icon(Icons.history),
                label: Text(
                  'Lịch sử',
                  style: TextStyle(fontSize: 16),
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