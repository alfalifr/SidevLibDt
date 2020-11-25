import 'Progression.dart';

extension ProgressionExt_Num<T extends num> on T {
  Progression<T> ranges(T last, [T step]){
    if(this is int){
      return IntProgression(this as int, last as int, (step ?? 1).toInt()) as Progression<T>;
    } else {
      return FloatProgression(this as double, last as double, (step ?? 1.0).toDouble()) as Progression<T>;
    }
  }
  Progression<T> until(T last, [T step]) => ranges(last - 1, step);
  Progression<T> downTo(T last) => ranges(last, -1 as T);
}