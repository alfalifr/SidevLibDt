import 'Set.dart';
import '../iterator/SimpleIterator.dart';

Set_<E> setOf<E>(Iterable<E> e) => _SetImpl(e.toSet());
MutableSet<E> mutableSetOf<E>(Iterable<E> e) => _SetImpl(e.toSet());

Set<E> toSimpleSet<E>(Set_<E> e) {
  if(e is _SetImpl){
    return (e as _SetImpl).content;
  }

  Set<E> set= {};
  for(var e in e){
    set.add(e);
  }
  return set;
}

class _SetImpl<E> extends MutableSet<E> {
  _SetImpl([this.content]){
    content ??= {};
  }

  Set<E> content;

  @override
  Iterator<E> get iterator => SimpleIteratorWrapper(content.iterator);

  @override
  int get size => content.length;

  @override
  bool add(E e) => content.add(e);

  @override
  bool remove(E e) => content.remove(e);

  @override
  bool contains_(E e) => content.contains(e);

  @override
  bool addAll(Iterable<E> es) {
    content.addAll(es);
    return es.isNotEmpty;
  }

  @override
  bool removeAll(Iterable<E> es) {
    var itr= es.iterator;
    var bool= false;
    while(itr.moveNext()){
      bool |= content.remove(itr.current);
    }
    return bool;
  }

  @override
  bool retainAll(Iterable<E> es) {
    var set= es.toSet();
    Set<E> retainedSet= {};
    for(var e in set){
      if(content.contains(e)){
        retainedSet.add(e);
      }
    }
    if(retainedSet.isNotEmpty){
      content = retainedSet;
      return true;
    } else {
      return false;
    }
  }

  @override
  MutableSet<E> subSet([int elementCount]) {
    elementCount ??= size;
    if(elementCount < 0) elementCount = size;
    Set<E> resContent = {};
    var i= 0;
    for(var e in content){
      if(i++ >= size) break;
      resContent.add(e);
    }
    return setOf(resContent);
  }

  @override
  String toString() => content.toString();
}