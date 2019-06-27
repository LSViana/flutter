import 'package:flutter/material.dart';
import 'package:flutter_play/counter_scoped_model/ui/counter_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'models/counter_model.dart';

class CounterScopedModel extends StatelessWidget {
  const CounterScopedModel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: CounterScreen(),
        )
      ),
    );
  }
}