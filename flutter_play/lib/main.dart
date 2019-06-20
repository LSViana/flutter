import 'package:flutter/material.dart';
import 'package:flutter_play/animations/intro_animations.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Build a Form',
          ),
        ),
        // body: BuildAForm(),
        body: IntroAnimations(),
      ),
    ),
  );
}
