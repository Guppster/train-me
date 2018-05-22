import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new TrainMe());

class TrainMe extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Train Me',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new ActionsList(),
    );
  }
}

class ActionsList extends StatefulWidget {
  @override
  ActionsListState createState() => new ActionsListState();
}

class ActionsListState extends State<ActionsList> {
  final suggestions = <WordPair>[];
  final saved = new Set<WordPair>();
  final biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Actions List'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, iterator) {
          if (iterator.isOdd) return new Divider();

          final index = iterator ~/ 2;

          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10));
          }

          return buildRow(suggestions[index]);
        });
  }

  Widget buildRow(WordPair words) {
    final previouslySaved = saved.contains(words);

    return new ListTile(
      title: new Text(
        words.asPascalCase,
        style: biggerFont,
      ),
      trailing: new Icon(
        previouslySaved ? Icons.favorite : Icons.favorite_border,
        color: previouslySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (previouslySaved) {
            saved.remove(words);
          } else {
            saved.add(words);
          }
        });
      },
    );
  }
}
