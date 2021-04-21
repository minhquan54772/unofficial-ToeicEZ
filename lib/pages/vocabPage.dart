import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:random_words/random_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Word {
  final String word, spelling, audiofile;
  final List definitions;

  Word({this.word, this.spelling, this.audiofile, this.definitions});

  factory Word.fromJson(Map<String, dynamic> json) {
    List senses =
        json['results'][0]['lexicalEntries'][0]['entries'][0]['senses'];
    List definitions = [];
    for (var i = 0; i < senses.length; i++) {
      definitions.add(senses[i]['definitions'][0]);
    }
    return Word(
      word: json['results'][0]['id'],
      spelling: json['results'][0]['lexicalEntries'][0]['entries'][0]
          ['pronunciations'][0]['phoneticSpelling'],
      definitions: definitions,
      audiofile: json['results'][0]['lexicalEntries'][0]['entries'][0]
          ['pronunciations'][0]['audioFile'],
    );
  }
}

Future<Word> getWord() async {
  var randomWord = generateNoun().take(1).first.toString();
  print(randomWord);
  final language = 'en-gb';
  var response = await http.get(
      Uri.https('od-api.oxforddictionaries.com',
          'api/v2/entries/' + language + '/' + randomWord),
      headers: {
        'app_id': 'ad8405bc',
        'app_key': '80416c3878acd76f93fddd6281be5b44'
      });
  var wordDetail = json.decode(response.body);
  return Word.fromJson(wordDetail);
}

getPLaySound(audioPlayer, _url) async {
  int res = await audioPlayer.play(_url);
  if (res == 1) {
    print("ok");
  } else {
    print('failed');
  }
}

class VocabPage extends StatefulWidget {
  @override
  _VocalPageState createState() => _VocalPageState();
}

class _VocalPageState extends State<VocabPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  Future<Word> futureWord;
  @override
  void initState() {
    super.initState();
    futureWord = getWord();
  }

  @override
  Widget build(BuildContext context) {
    Future<Word> futureWord = getWord();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Text('TỪ VỰNG')],
          ),
        ),
        body: Center(
          child: FutureBuilder(
            future: futureWord,
            builder: (context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data.word,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "/" + snapshot.data.spelling + "/",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.volume_up,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          getPLaySound(audioPlayer, snapshot.data.audiofile);
                        },
                        tooltip: "Play sound",
                        iconSize: 30,
                      )
                    ],
                  ),
                  for (var def in snapshot.data.definitions)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        def,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                ];
                return ListView(
                  children: children,
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
            },
            label: Text('Từ tiếp theo'),
            icon: Icon(Icons.refresh)));
  }
}
