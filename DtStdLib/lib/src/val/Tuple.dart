import 'package:DtStdLib/src/scope/Scope.dart';

abstract class Tuple {
  int get n;
}

class Pair<T1, T2> extends Tuple {
  Pair(this.first, this.second);
  int get n => 2;
  T1 first;
  T2 second;

  @override
  String toString() => "($first,$second)";

  @override
  bool operator ==(other) {
    if(other is Pair) return other.first == first && other.second == second;
    return super == other;
  }
}

class Triple<T1, T2, T3> extends Tuple {
  Triple(this.first, this.second, this.third);
  int get n => 3;
  T1 first;
  T2 second;
  T3 third;

  @override
  String toString() => "($first,$second,$third)";

  @override
  bool operator ==(other) {
    if(other is Triple) return other.first == first && other.second == second && other.third == third;
    return super == other;
  }
}