import 'dart:math';

import 'package:DtStdLib/src/val/Constant.dart';

import '_ListImpl.dart';
import 'List.dart';
import '_IterableFun.dart';
import '../range/_ProgressionFun.dart';
import '../val/_ValFun.dart';
import '../scope/Scope.dart';

extension MutableListExt_<E> on MutableList<E> {
  void sortBy<E2 extends Comparable<E2>>(E2 Function(E e) toComparableFun, [SortOrder order = SortOrder.ASCEND]) {
    var compareFun= (E2 e1, E2 e2) => e1 > e2;
    if(order == SortOrder.DESCEND){
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
    var rand= Random();
    var lastIndex= size-1;

    for(var i in 0.until(size)){
      var u= rand.nextInt(lastIndex);
      var temp= this[i];
      this[i]= this[u];
      this[u]= temp;
    }
  }
}
extension ListExt_<E> on List_<E> {
  List<E> toList() => toSimpleList(this);
  List_<E> sortedBy<E2 extends Comparable<E2>>(E2 Function(E e) toComparableFun, [SortOrder order = SortOrder.ASCEND]) =>
      subList(0).toMutableList().also((it) => it.sortBy(toComparableFun, order));
  List_<E> shuffled() => subList(0).toMutableList().also((it) => it.shuffle());
}


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
