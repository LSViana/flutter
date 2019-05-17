import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class CounterRestarter extends StatelessWidget {
  
  final VoidCallback onPressed;

  CounterRestarter({
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //
    return FlatButton(
      textColor: theme.primaryColor,
      child: Text('Reset'.toUpperCase()),
      onPressed: onPressed,
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //
    return RaisedButton(
      color: theme.primaryColor,
      textTheme: ButtonTextTheme.primary,
      onPressed: this.onPressed,
      child: Text('Increment'.toUpperCase()),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int counter;

  CounterDisplay({
    this.counter
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Count: $counter'
    );
  }
  
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            CounterIncrementor(onPressed: _increment),
            SizedBox(width: 12),
            CounterRestarter(onPressed: _reset),
            SizedBox(width: 12),
            CounterDisplay(counter: _counter),
          ],
        ),
      )
    );
  }
}