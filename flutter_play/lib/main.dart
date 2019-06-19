import 'package:flutter/material.dart';
import 'package:flutter_play/animations/examples_docs.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lime,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animation Examples',
          ),
        ),
        body: AnimationExamples(),
      ),
    ),
  );
}
