import 'dart:math';

import 'package:DtStdLib/DtStdLib.dart';
import 'package:DtStdLib/src/number/_DigitFun.dart';

extension Factorization_IntExt on int {
  bool get isPrime {
    for(var i in 2.until(this)){
      if(this % i == 0) return false;
    }
    return true;
  }

  int nextPrime() {
    var primeItr= this + 1;
    while(!primeItr.isPrime) {
      primeItr++;
    }
    return primeItr;
  }

  bool isFactorOf(int other) => other % this == 0;

  List_<int> primeFactors() {
    final factors= <int>[];
    var factorProgression= this;
    var primeItr= 2;
    while(factorProgression > 1){
      if(primeItr.isFactorOf(factorProgression)){
      factorProgression ~/= primeItr;
      factors.add(primeItr);
      } else {
        primeItr= primeItr.nextPrime();
      }
    }
    return factors.toList_();
  }

  int kpk(int other) => (primeFactors().union(other.primeFactors())).reduce((acc, i) => acc * i);

  int fpb(int other) {
    try {
      return (primeFactors().intersect(other.primeFactors())).reduce((acc, i) => acc * i);
    } catch(Exception) {
      return 1;
    }
  }

}

extension Factorization_NumExt<T extends num> on num {
  bool get isPrime {
    if(this is int) return (this as int).isPrime;
    final vals = noDecimalValue;
    for(final i in 2.until(vals)){
      if(vals % i == 0) {
        return false;
      }
    }
    return true;
  }

  num nextPrime() {
    final factor= 10.pow(getDigitBehindDecimal());
    final vals= (this * factor).toInt();
    var primeItr= vals + 1;
    while(!primeItr.isPrime) {
      primeItr++;
    }
    return primeItr / factor;
  }

  bool isFactorOf(num other) => other % this == 0;

  List<num> primeFactors() {
    final factors= <num>[]; //ArrayList<Number>()
    final factor= 10.pow(getDigitBehindDecimal());
    final vals= (this * factor).toInt();

    var factorProgression= vals;
    var primeItr= 2;

    while(factorProgression > 1){
      if(primeItr.isFactorOf(factorProgression)){
        factorProgression ~/= primeItr;
        factors.add((primeItr / factor));
      } else{
        primeItr= primeItr.nextPrime();
      }
    }
    return factors;
  }

  num kpk(num other) {
    final commonScale= getFloatingCommonScale([this, other]);
    final thisVal= (this * commonScale).toInt();
    final otherVal= (other * commonScale).toInt();
    return (thisVal.primeFactors().union(otherVal.primeFactors())).reduce((acc, i) => acc * i);
  }

  num fpb(num other) {
    final commonScale= getFloatingCommonScale([this, other]);
    final thisVal= (this * commonScale).toInt();
    final otherVal= (other * commonScale).toInt();
    try {
      return (thisVal.primeFactors().intersect(otherVal.primeFactors())).reduce((acc, i) => acc * i);
    } catch(Exception) {
      return 1;
    }
  }

}


int kpkInt(Iterable<int> numbers) => numbers.map((it) => it.primeFactors())
    .reduce((acc, list) => acc.union(list))
    .reduce((acc, i) => acc * i);

int fpbInt(Iterable<int> numbers){
  try{
    return numbers.map((it) => it.primeFactors())
        .reduce((acc, list) => (acc.intersect(list)))
        .reduce((acc, i) => acc * i);
  } catch (UnsupportedOperationException){
    return 1;
  }
}


num kpk(List<num> numbers) {
  final commonScale= getCommonScale(numbers);
  return numbers.map((it) => (it * commonScale).toInt())
    .map((it) => it.primeFactors() )
    .reduce((acc, list) => acc.union(list) )
    .reduce((acc, i) => acc * i ) / commonScale.toDouble();
}

num fpb(List<num> numbers) {
  final commonScale= getCommonScale(numbers);
  try{
    return numbers.map((it) => (it * commonScale).toInt())
      .map((it) => it.primeFactors())
      .reduce((acc, list) => acc.intersect(list))
      .reduce((acc, i) => acc * i ) / commonScale.toDouble();
  } on Exception { return 1; }
}


int factorialInt(int n) {
  if(n <= 1) {
    return 1;
  } else {
    return n * factorial(n-1);
  }
}

num factorial(num n) => n <= 1 ? 1 : n * factorial(n-1);


int getCommonScale(List<num> nums) =>
  10.powCast(nums.map((it) => it.getDigitBehindDecimal()).reduce((acc, i) => max(acc, i)));

double getFloatingCommonScale(List<num> nums) =>
  10.0.powCast(nums.map((it) => it.getDigitBehindDecimal()).reduce((acc, i) => max(acc, i)));