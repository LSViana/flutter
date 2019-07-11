import 'package:flutter/material.dart';
import 'package:flutter_play/counter_bloc/app.dart';
import 'package:flutter_play/counter_bloc/blocs/counter_bloc.dart';
import 'package:flutter_play/counter_bloc/ui/change_screen.dart';

class CounterScreen extends StatelessWidget {

  final CounterBloc _counterBloc = getIt<CounterBloc>();

  CounterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          StreamBuilder<int>(
            stream: _counterBloc.counter,
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return Text(
                  'Error fetching value',
                );
              } else if(snapshot.hasData) {
                return Text(
                  'Current value: ${snapshot.data}',
                );
              }
              return CircularProgressIndicator();
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
