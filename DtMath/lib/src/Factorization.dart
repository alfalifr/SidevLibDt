import 'package:DtStdLib/DtStdLib.dart';

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


int kpk(Iterable<int> numbers) => numbers.map((it) => it.primeFactors())
    .reduce((acc, list) => acc.union(list))
    .reduce((acc, i) => acc * i);

int fpb(Iterable<int> numbers){
  try{
    return numbers.map((it) => it.primeFactors())
        .reduce((acc, list) => (acc.intersect(list)))
        .reduce((acc, i) => acc * i);
  } catch (UnsupportedOperationException){
    return 1;
  }
}

int factorial(int n) {
  if(n <= 1) {
    return 1;
  } else {
    return n * factorial(n-1);
  }
}