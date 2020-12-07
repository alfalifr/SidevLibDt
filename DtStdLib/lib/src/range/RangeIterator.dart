import 'package:DtStdLib/src/exception/IllegalArgExc.dart';

abstract class ProgressionIterator<T extends num> extends Iterator<T> {
  ProgressionIterator(this.first, this.last, this.step){
    if(step == 0) throw IllegalArgExc("step", "`step` gak boleh 0 pada [ProgressionIterator]");
    checkLimitFun = step > 0 ? (curr, last) => curr <= last : (curr, last) => curr >= last;
  }

  final T first;
  final T last;
  final T step;

  T _current;
  bool Function(T curr, T last) checkLimitFun;

  @override
  bool moveNext() => checkLimitFun(_current= _current != null ? _current +step : first, last);

  @override
  T get current => _current;
/*
  {
    if(_current == null){
      _current = first;
    } else {
      _current += step;
    }
    return _current;
  }
 */
}

class IntProgressionIterator extends ProgressionIterator<int> {
  IntProgressionIterator(int first, int last, int step) : super(first, last, step);
}

class FloatProgressionIterator extends ProgressionIterator<double> {
  FloatProgressionIterator(double first, double last, double step) : super(first, last, step);
}