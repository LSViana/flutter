import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 0;
  BehaviorSubject<int> _behaviorSubject;

  CounterBloc() {
    _counter = 0;
    _behaviorSubject = BehaviorSubject<int>.seeded(_counter);
  }

  Observable<int> get counter {
    return _behaviorSubject.stream;
  }

  Observable<int> get counter100 {
    return _behaviorSubject.stream
      .map((value) => 100 - value);
  }

  void increment() {
    _counter++;
    _behaviorSubject.add(_counter);
  }

  void decrement() {
    _counter--;
    _behaviorSubject.add(_counter);
  }

  void dispose() async {
    await _behaviorSubject.close();
  }
}