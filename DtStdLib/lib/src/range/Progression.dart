import 'package:DtStdLib/src/exception/IllegalArgumentExc.dart';

import 'RangeIterator.dart';

abstract class Progression<T extends num> extends Iterable<T> {
  T first;
  T last;
  T step;
}


class IntProgression extends Progression<int> {
  IntProgression(this.first, this.last, this.step){
    if(step == 0) throw IllegalArgumentExc("step", "`step` gak boleh 0 pada [IntProgression]");
  }
  int first;
  int last;
  int step;

  @override
  Iterator<int> get iterator => IntProgressionIterator(first, last, step);
}
class FloatProgression extends Progression<double> {
  FloatProgression(this.first, this.last, this.step){
    if(step == 0) throw IllegalArgumentExc("step", "`step` gak boleh 0 pada [FloatProgression]");
  }
  double first;
  double last;
  double step;

  @override
  Iterator<double> get iterator => FloatProgressionIterator(first, last, step);
}

