import 'package:flutter/material.dart';
import 'package:flutter_play/counter_scoped_model/models/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ChangeScreen extends StatelessWidget {
  const ChangeScreen({Key key}) : super(key: key);

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
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return Text('Current value: ${model.counter}');
              },
            ),
            ScopedModelDescendant<CounterModel>(
              builder: (context, child, model) {
                return RaisedButton(
                  child: Text('INCREMENT'),
                  onPressed: () => model.increment(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
