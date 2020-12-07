import 'dart:math';

//import 'package:DtStdLib/src/val/Constant.dart';
import 'package:DtStdLib/src/val/Enums.dart';

import 'ListImpl.dart';
import 'List.dart';
import '_IterableFun.dart';
import '../range/_ProgressionFun.dart';
import '../val/_ValFun.dart';
import '../scope/_ScopeFun.dart';


extension MutableListExt_<E> on MutableList<E> {
  void reverse(){
    final size= this.size;
    if(size == 1) return;
    final mid= (size ~/ 2) + (size % 2);
    var tail= size - 1;
    for(final i in 0.until(mid)){
      final temp= this[i];
      this[i]= this[tail];
      this[tail--]= temp;
    }
  }

  void sortBy<E2 extends Comparable<E2>>(E2 Function(E e) toComparableFun, [Order order = Order.ASC]) {
    var compareFun= (E2 e1, E2 e2) => e1 > e2;
    if(order == Order.DESC){
      compareFun= (E2 e1, E2 e2) => e1 < e2;
    }
    for(var ei in withIndex()){
      var e1= ei.value;
      var i= ei.index;
      for(var u in (i +1).until(size)){
        var e2= this[u];
        if(compareFun(toComparableFun(e1), toComparableFun(e2))){
          this[i]= e2;
          this[u]= e1;
        }
      }
    }
  }
  void shuffle() {
    final rand= Random();
    final size= this.size;
    final lastIndex= size-1;
    final threeFourth= size * 3 ~/ 4;
    final from= rand.nextInt(threeFourth);
    var until= rand.nextInt(size);
    if(until < from){
      if(from == size-1) {
        until= size;
      } else {
        until= size +2;
      }
    }
    final shuffSize= until - from;

    for(var i in from.until(until)){
      final u= rand.nextInt(shuffSize) + from;
      final temp= this[i];
      this[i]= this[u];
      this[u]= temp;
    }
  }
}
extension ListExt_<E> on List_<E> {
  List<E> toList() => toSimpleList(this);
  List_<E> sortedBy<E2 extends Comparable<E2>>(E2 Function(E e) toComparableFun, [Order order = Order.ASC]) =>
      subList(0).toMutableList().also((it) => it.sortBy(toComparableFun, order));
  List_<E> shuffled() => subList(0).toMutableList().also((it) => it.shuffle());
}

/*
extension MutableListExt_Comparable<E extends Comparable<E>> on MutableList<E> {
  void sort([SortOrder order = SortOrder.ASCEND]) {
    var compareFun= (E e1, E e2) => e1 > e2;
    if(order == SortOrder.DESCEND){
      compareFun= (E e1, E e2) => e1 < e2;
    }
    for(var ei in withIndex()){
      var e1= ei.value;
      var i= ei.index;
      for(var u in (i +1).until(size)){
        var e2= this[u];
        if(compareFun(e1, e2)){
          this[i]= e2;
          this[u]= e1;
        }
      }
    }
  }
}
extension ListExt_Comparable<E extends Comparable<E>> on List_<E> {
  List_<E> sorted([SortOrder order = SortOrder.ASCEND]) => subList(0).toMutableList().also((it) => it.sort(order));
}
 */