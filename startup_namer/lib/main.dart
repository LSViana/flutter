import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Greetings, Flutter",
      theme: new ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.red
      ),
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(height: 0);
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
        });
      },
    );
  }

  void _pushSavedRoute() {
    Navigator.of(this.context).push(
      new MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map((pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          });
          final divided = ListTile
          .divideTiles(context: context, tiles: tiles)
          .toList();
          return new Scaffold(
            appBar: new AppBar(
              title: const Text("Saved Suggestions"),
            ),
            body: new ListView(children: divided),
          );
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSavedRoute),
        ]
      ),
      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}
