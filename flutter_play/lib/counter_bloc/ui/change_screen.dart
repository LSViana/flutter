import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_play/counter_bloc/app.dart';
import 'package:flutter_play/counter_bloc/blocs/counter_bloc.dart';
import 'package:flutter_play/counter_bloc/models/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';

Color getRandomColor() {
  var random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({Key key}) : super(key: key);

  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  int _localValue = 0;
  final CounterBloc _counterBloc = getIt<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.5),
      appBar: AppBar(
        title: Text('Change Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 128),
            Text(
              'Local value: $_localValue',
              style: TextStyle(
                color: getRandomColor(),
              )
            ),
            RaisedButton(
              child: Text(
                'INCREMENT LOCAL',
              ),
              onPressed: () {
                setState(() {
                 _localValue++; 
                });
              },
            ),
            StreamBuilder<int>(
              stream: _counterBloc.counter,
              builder: (context, snapshot) {
                if(!snapshot.hasData)
                  return CircularProgressIndicator();
                var value = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Current value: ${value}',
                      style: TextStyle(
                        color: getRandomColor(),
                      )
                    ),
                  ],
                );
              },
            ),
            StreamBuilder<int>(
              stream: _counterBloc.counter100,
              builder: (context, snapshot) {
                if(!snapshot.hasData)
                  return CircularProgressIndicator();
                var value = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Current value: ${value}',
                      style: TextStyle(
                        color: getRandomColor(),
                      )
                    ),
                  ],
                );
              },
            ),
            StreamBuilder<int>(
              stream: _counterBloc.counter,
              builder: (context, snapshot) {
                return RaisedButton(
                  child: Text('INCREMENT'),
                  onPressed: () => _counterBloc.increment(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
