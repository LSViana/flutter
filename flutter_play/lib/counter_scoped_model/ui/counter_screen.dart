import 'package:flutter/material.dart';
import 'package:flutter_play/counter_scoped_model/models/counter_model.dart';
import 'package:flutter_play/counter_scoped_model/ui/change_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ScopedModelDescendant<CounterModel>(
            builder: (context, child, model) {
              return Text('Current value: ${model.counter}');
            },
          ),
          RaisedButton(
            onPressed: () => this.openChangeScreen(context),
            child: Text(
              'CHANGE SCREEN'
            ),
          )
        ],
      ),
    );
  }

  void openChangeScreen(BuildContext context) async {
    await Navigator.push(
      context,
      new PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, entrance, leaving) => ChangeScreen(),
      )
    );
  }
}
