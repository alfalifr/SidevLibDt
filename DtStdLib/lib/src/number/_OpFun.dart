
// ignore: library_prefixes
import 'dart:math' as dMath;
import '../scope/_ScopeFun.dart';

extension OpFun_NumExt<T extends num> on T {
  T powCast(num other) => dMath.pow(this, other).let((it) {
    if(this is int) {
      return it.toInt() as T;
    } else {
      return it.toDouble() as T;
    }
  });
  num pow(num other) => dMath.pow(this, other);
}