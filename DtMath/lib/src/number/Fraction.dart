import 'dart:math';

import 'Number.dart';
import '_NumberFun.dart';
import '../Factorization.dart';
import 'package:DtStdLib/src/val/Tuples.dart';
import 'package:DtStdLib/src/scope/_ScopeFun.dart';

abstract class Fraction<T extends num> extends Number<Fraction<T>> {
  T numerator;
  T denominator;
  double get realNumber => numerator / denominator;

  int toInt() => realNumber.toInt();
  double toDouble() => realNumber;

  bool operator >(Fraction other) => realNumber > other.realNumber;
  bool operator >=(Fraction other) => realNumber >= other.realNumber;
  bool operator <(Fraction other) => realNumber < other.realNumber;
  bool operator <=(Fraction other) => realNumber <= other.realNumber;

  bool mt(num other) => realNumber > other;
  bool mtEq(num other) => realNumber >= other;
  bool lt(num other) => realNumber < other;
  bool ltEq(num other) => realNumber <= other;

  Fraction operator +(Fraction other) => makeCommonFractions(other).let((pair) {
    final fr1= pair.first;
    final fr2= pair.second;
    final nume= fr1.numerator + fr2.numerator;
    final deno= fr1.denominator;
    if(this is IntFraction) return fractionOf(nume, deno);
    return floatingFractionOf(nume, deno);
  });
  Fraction operator -(Fraction other) => makeCommonFractions(other).let((pair) {
    final fr1= pair.first;
    final fr2= pair.second;
    final nume= fr1.numerator - fr2.numerator;
    final deno= fr1.denominator;
    if(this is IntFraction) return fractionOf(nume, deno);
    return floatingFractionOf(nume, deno);
  });
  Fraction operator *(Fraction other) => floatingFractionOf(numerator * other.numerator, denominator * other.denominator);
  Fraction operator /(Fraction other) => floatingFractionOf(numerator * other.denominator, denominator * other.numerator);

  Fraction plus(num other) => this + other.toFraction();
  Fraction minus(num other) => this - other.toFraction();
  Fraction times(num other) => this * other.toFraction();
  Fraction div(num other) => this / other.toFraction();


  @override
  int compareTo(Fraction other) => realNumber.compareTo(other.realNumber);
  int compareToNum(num other) => realNumber.compareTo(other);

  Pair<Fraction, Fraction> makeCommonFractions(Fraction other);
  Fraction<T> simply();

  @override
  String toString() => "$numerator/$denominator";

  @override
  bool operator ==(other) {
    if(other is Fraction) return realNumber == other.realNumber;
    if(other is num) return realNumber == other;
    return super == other;
  }
}

abstract class IntFraction extends Fraction<int> {
  @override
  Pair<IntFraction, IntFraction> makeCommonFractions(Fraction other) {
    if(other is FloatingFraction) other= (other as FloatingFraction).toIntFraction();
    return (denominator.kpk(other.denominator.toInt())).let((kpk) {
      return Pair(
        fractionOf(numerator * kpk ~/ denominator, kpk),
        fractionOf(other.numerator * kpk ~/ other.denominator, kpk),
      );
    });
  }
  @override
  IntFraction simply() => (numerator.fpb(denominator)).let((fpb) {
    return fractionOf(numerator ~/ fpb, denominator ~/ fpb);
  });
}
abstract class FloatingFraction extends Fraction<double> {
  @override
  Pair<FloatingFraction, FloatingFraction> makeCommonFractions(Fraction other) {
    final thisDenoDigit = denominator.digitBehindDecimal;
    final otherDenoDigit = other.denominator.digitBehindDecimal;
    final usedDenoDigit = max(thisDenoDigit, otherDenoDigit);
    final usedDenoFactor = 10.pow(usedDenoDigit);

    return ((denominator * usedDenoFactor).toInt().kpk((other.denominator * usedDenoFactor).toInt())).let((kpk) {
      return Pair(
        floatingFractionOf(numerator * kpk / denominator, kpk),
        floatingFractionOf(other.numerator * kpk / other.denominator, kpk),
      );
    });
  }
  @override
  FloatingFraction simply() {
    final denoDigit = denominator.digitBehindDecimal;
    final numeDigit = numerator.digitBehindDecimal;
    final usedDigit = max(denoDigit, numeDigit);
    final usedFactor = 10.pow(usedDigit);

    return ((numerator * usedFactor).toInt().fpb((denominator * usedFactor).toInt())).let((fpb) {
      return floatingFractionOf(numerator / fpb * usedFactor, denominator / fpb * usedFactor);
    });
  }

  @override
  IntFraction toIntFraction() => simply().let((it) => fractionOf(it.numerator, it.denominator));
}


IntFraction fractionOf(num numerator, num denominator) =>
    _IntFractionImpl(numerator.toInt(), denominator.toInt());

FloatingFraction floatingFractionOf(num numerator, num denominator) =>
    _FloatingFractionImpl(numerator.toDouble(), denominator.toDouble());


class _IntFractionImpl extends IntFraction {
  _IntFractionImpl(this.numerator, this.denominator);
  int numerator;
  int denominator;
}
class _FloatingFractionImpl extends FloatingFraction {
  _FloatingFractionImpl(this.numerator, this.denominator);
  double numerator;
  double denominator;
}