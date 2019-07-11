import 'package:flutter/material.dart';
import 'package:flutter_play/counter_bloc/blocs/counter_bloc.dart';
import 'package:flutter_play/counter_bloc/models/counter_model.dart';
import 'package:flutter_play/counter_bloc/ui/counter_screen.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt();

class CounterBlocApp extends StatelessWidget {

  CounterBlocApp({Key key}) : super(key: key) {
    getIt.registerLazySingleton(() => CounterBloc());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: CounterScreen(),
    ));
  }
}
