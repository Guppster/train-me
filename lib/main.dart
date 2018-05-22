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
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Actions'),
        ),
        body: new Center(
          child: new ActionsList(),
        ),
      ),
    );
  }
}

class ActionsList extends StatefulWidget {
  @override
  ActionsListState createState() => new ActionsListState();
}

class ActionsListState extends State<ActionsList> {
  @override
  Widget build(BuildContext context) {
      return new Text(new WordPair.random().asPascalCase);
  }
}
