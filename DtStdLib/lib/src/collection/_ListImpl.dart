import 'List.dart';
import '../range/_ProgressionFun.dart';

List_<E> listOf<E>(Iterable<E> e) => _MutableListImpl(e.toList());
MutableList<E> mutableListOf<E>(Iterable<E> e) => _MutableListImpl(e.toList());

List<E> toSimpleList<E>(List_<E> e) {
  if(e is _MutableListImpl){
    return (e as _MutableListImpl).content;
  }

  var list= [];
  for(var e in e){
    list.add(e);
  }
  return list;
}


class _MutableListImpl<E> extends MutableList<E> {
  _MutableListImpl([this.content]){
    content ??= [];
  }

  List<E> content;

  @override
  int get size => content.length;

  @override
  Iterator<E> get iterator => content.iterator;

  @override
  E operator [](int i) => content[i];

  @override
  void operator []=(int i, E e) => content[i] = e;

  @override
  int indexOf(E e, [int start = 0]) => content.indexOf(e, start);

  @override
  bool add(E e, [int i]) {
    if(i == null){
      content.add(e);
    } else {
      var afterI= content.sublist(i);
      content[i]= e;

      var u= 0;
      for(i+1; i <= size; i++){
        content[i]= afterI[u++];
      }
    }
    return true;
  }

  @override
  bool remove(E e) => content.remove(e);

  @override
  E removeAt(int i) => content.removeAt(i);

  @override
  bool contains_(E e) => content.contains(e);

  @override
  bool contains(Object o) => content.contains(o);

  @override
  MutableList<E> subList(int start, [int end]) => _MutableListImpl(content.sublist(start, end));

  @override
  bool addAll(Iterable<E> es, [int i]) {
    if(i == null){
      content.addAll(es);
    } else {
      final itr= es.iterator;
      final afterIList= <E>[];
      for(var u in i.until(size)) {
        afterIList.add(content[u]);
      }
      var u= i;
      while(u < size && itr.moveNext()){
        content[u++]= itr.current;
      }
      while(itr.moveNext()){
        content.add(itr.current);
      }
      content.addAll(afterIList);
    }
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
    var list= es.toList();
    var retainedList= [];
    for(var e in content){
      if(list.contains(e)){
        retainedList.add(e);
      }
    }
    if(retainedList.isNotEmpty){
      content = retainedList;
      return true;
    } else {
      return false;
    }
  }

  @override
  String toString() => content.toString();
}