import 'dart:math';
import 'package:DtStdLib/DtStdLib.dart';
import 'package:DtStdLib/src/exception/ElementExc.dart';

import '../number/Number.dart';

int randomInt([int max, Random random]) => (random ?? Random()).nextInt(max ?? int64MaxValue);
double randomDouble([Random random]) => (random ?? Random()).nextDouble();

extension Random_IterableExt<E> on Iterable<E> {
  E random() {
    if(isEmpty) throw ElementExc.noElement();

    int size;
    if(this is Collection) {
      size = (this as Collection).size;
    } else if(this is List) {
      size = (this as List).length;
    } else if(this is Set) {
      size = (this as Set).length;
    }

    var index= randomInt(size ??- 1);
    if(this is List) return (this as List)[index];
    if(this is List_) return (this as List_)[index];
    for(var ei in withIndex()){
      if(ei.index == index){
        return ei.value;
      }
    }
  }
}