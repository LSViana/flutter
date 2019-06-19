import 'package:flutter/material.dart';
import 'animations/examples_docs.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animation Examples',
          ),
        ),
        // body: BuildAForm(),
        body: AnimationExamples(),
      ),
    ),
  );
}
