import 'dart:math';

import 'package:flutter/material.dart';

final random = Random();

Color getRandomColor() => Color
  .fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256)
  );

class SetStateTest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SetStateTestState();
  }

}

class SetStateTestState extends State<SetStateTest> {

  int value1 = 10;
  int value2 = 20;
  int value3 = 30;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: getRandomColor(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Set State Test',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                child: Text(value1.toString()),
                color: getRandomColor(),
                onPressed: () => this.setState(() { value1++; }),
              ),
              RaisedButton(
                child: Text(value2.toString()),
                color: getRandomColor(),
                onPressed: () => this.setState(() { value2++; }),
              ),
              RaisedButton(
                child: Text(value3.toString()),
                color: getRandomColor(),
                onPressed: () => this.setState(() { value3++; }),
              ),
              RaisedButton(
                child: Text('HELLO, WORLD!'),
                color: getRandomColor(),
                onPressed: () {},
              ),
              AnotherStatefulWidget()
            ],
          ),
        ),
      ),
    );
  }

}

class AnotherStatefulWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AnotherStatefulWidgetState();
  }

}

class AnotherStatefulWidgetState extends State<AnotherStatefulWidget> {

  int value1 = 100;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text(value1.toString()),
          color: getRandomColor(),
          onPressed: () => this.setState(() { value1++; }),
        ),
      ],
    );
  }

}