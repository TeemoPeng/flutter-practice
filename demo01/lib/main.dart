import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: AppBar(
          title: new Text('Welcome to Flutter')
        ),
        body: new Container(          
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              top: 20.0,
              right: 20.0,
              bottom: 20.0
            ),
            child: new RandomWords()
          ),
        )
      )
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State{
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asCamelCase);
  }
}