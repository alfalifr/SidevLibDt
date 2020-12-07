//import 'package:DtStdLib/DtStdLib.dart';
import 'package:DtStdLib/src/collection/SimpleIterable.dart';
import '../range/_ProgressionFun.dart';
import '_ListFun.dart';
import 'Set.dart';
import 'SetImpl.dart';
import 'List.dart';
import 'ListImpl.dart';
import 'Map.dart';
import 'MapImpl.dart';

extension IterableExt<T> on Iterable<T> {
  IndexingIterable<T> withIndex() => IndexingIterable(this);

  Set_<T> toSet_() {
    if(this is Set_) return this;
    return setOf(this);
  }
  MutableSet<T> toMutableSet() {
    if(this is MutableSet) return this;
    return mutableSetOf(this);
  }

  List_<T> toList_() {
    if(this is List_) return this;
    return listOf(this);
  }
  MutableList<T> toMutableList() {
    if(this is MutableList) return this;
    return mutableListOf(this);
  }

//  List_<E> toList_() => listOf(this);
//  MutableList<E> toMutableList() => mutableListOf(this);
  List_<T> copy([int from= 0, int until, bool reversed= false]){
    final until_= until ?? length;
    print("List.copy() from= $from until_= $until_");
    final resList= mutableListOf<T>();
    List<T> list= this is List<T> ? this
        : this is List_<T> ? toSimpleList(this as List_) : null; //toList();

    if(list == null){
      final itr= iterator;
      final range= from.until(until_);

      var i= 0;
      while(itr.moveNext()){
        if(i > range.last) break;
        final e= itr.current;
        if(range.contains(i++)){
          resList.add(e);
        }
      }
    } else {
      for(final i in from.until(until_)){
        resList.add(list[i]);
      }
    }

    if(reversed) {
      resList.reverse();
    }
    return resList;
  }
}

extension IterableExt_Map<K, V> on Iterable<MapEntry<K, V>> {
  Map_<K, V> toMap_() => mapOfEntries(this);
  MutableMap<K, V> toMutableMap() => mutableMapOfEntries(this);
}