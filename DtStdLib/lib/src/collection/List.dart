import 'Collection.dart';

abstract class List_<E> extends Collection<E> {
  E operator[](int i);
  int indexOf(E e, [int start = 0]);
  List_<E> subList(int start, [int end]);
}

abstract class MutableList<E> extends List_<E> implements MutableCollection<E> {
  operator []=(int i, E e);
  @override
  bool add(E e, [int i]);
  @override
  bool addAll(Iterable<E> es, [int i]);
  E removeAt(int i);
  @override
  MutableList<E> subList(int start, [int end]);
}