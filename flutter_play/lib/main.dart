import 'package:flutter/material.dart';
import 'package:flutter_play/cookbooks/forms/create_style_text_field.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Build a Form',
          ),
        ),
        // body: BuildAForm(),
        body: CreateAndStyleTextField(),
      ),
    ),
  );
}
