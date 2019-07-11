import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;
  int get counter100 => 100 - _counter;

  void increment() {
    _counter++;
    super.notifyListeners();
  }

  void decrement() {
    _counter--;
    super.notifyListeners();
  }
}