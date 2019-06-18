import 'package:flutter/material.dart';
import 'cookbooks/gestures/add_ripples.dart';

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
        body: MaterialRipples(),
      ),
    ),
  );
}
