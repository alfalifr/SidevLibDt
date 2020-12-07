import 'package:DtStdLib/src/exception/IllegalArgExc.dart';

import 'RangeIterator.dart';

abstract class Progression<T extends num> extends Iterable<T> {
  T first;
  T last;
  T step;

  @override
  bool contains(Object element) => element is num ? {
    step > 0 ? first <= element && element <= last
      : last <= element && element <= first
  } : false;
}


class IntProgression extends Progression<int> {
  IntProgression(this.first, this.last, this.step){
    if(step == 0) throw IllegalArgExc("step", "`step` gak boleh 0 pada [IntProgression]");
  }
  int first;
  int last;
  int step;

  @override
  Iterator<int> get iterator => IntProgressionIterator(first, last, step);
}
class FloatProgression extends Progression<double> {
  FloatProgression(this.first, this.last, this.step){
    if(step == 0) throw IllegalArgExc("step", "`step` gak boleh 0 pada [FloatProgression]");
  }
  double first;
  double last;
  double step;

  @override
  Iterator<double> get iterator => FloatProgressionIterator(first, last, step);
}

