import 'package:flutter/material.dart';
import 'animations/intro.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animations Intro',
          ),
        ),
        // body: BuildAForm(),
        body: AnimationsIntro(),
      ),
    ),
  );
}
