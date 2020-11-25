import 'package:DtStdLib/DtStdLib.dart';
import 'package:DtStdLib/src/collection/SimpleIterable.dart';

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
}

extension IterableExt_Map<K, V> on Iterable<MapEntry<K, V>> {
  Map_<K, V> toMap_() => mapOfEntries(this);
  MutableMap<K, V> toMutableMap() => mutableMapOfEntries(this);
}