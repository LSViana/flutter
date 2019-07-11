import 'package:flutter/material.dart';

class ChartsApp extends StatefulWidget {
  ChartsApp({Key key}) : super(key: key);

  _ChartsAppState createState() => _ChartsAppState();
}

class _ChartsAppState extends State<ChartsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Charts in Flutter'
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Text('Charts to be added'),
        ),
      ),
    );
  }
}