import 'dart:math' as dm;

import 'Fraction.dart';

extension NumExt<T extends num> on T {
  int get digitBehindDecimal {
    if(this is int) return 0;

    final str= toString();
    return str.length - str.indexOf(".") - 1;
  }

  int get roundUpDecimal {
    if(this is int) return this as int;

    return (this * 10.pow(digitBehindDecimal)).toInt();
  }

  T get absoluteValue {
    if(this >= 0) return this;
    return -this;
  }

  IntFraction toFraction() {
    if(this is int) return fractionOf(this, 1);
    final decimalFactor= digitBehindDecimal * 10;
    return fractionOf(this * decimalFactor, decimalFactor).simply();
  }

  T pow(T exp) => dm.pow(this, exp);
}

extension FractionExt<T extends num> on Fraction<T> {
  Fraction operator +(num other) => this + other.toFraction();
  Fraction operator -(num other) => this - other.toFraction();
  Fraction operator *(num other) => this * other.toFraction();
  Fraction operator /(num other) => this / other.toFraction();
}
