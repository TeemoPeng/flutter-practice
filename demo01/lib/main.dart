import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

List<Map> items = [
  { 'name': 'Container组件'},
  { 'name': 'Text组件'}
];

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      // home: new RandomWords(),
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
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return new ElevatedButton(
                  child: Text(items[index]['name']),
                  onPressed: () {
                    print('点击按钮');
                  },
                );
              }
            )
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
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asCamelCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator')
      ),
      body: _buildSuggestions()
    );
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions () {
    return new ListView.builder(
      padding: const EdgeInsets.all(15.0),
      itemBuilder: (context, i){
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asCamelCase,
        style: _biggerFont
      )
    );
  }
}