import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int count = 0;
  int get counts => count;
  increment() {
    count++;
    notifyListeners();
  }
}