import 'Collection.dart';

abstract class Set_<E> extends Collection<E> {
  Set_<E> subSet([int elementCount]);
}
abstract class MutableSet<E> extends Set_<E> implements MutableCollection<E> {
  /// return `true` jika [e] blum ada seblumnya di `this`.
  @override
  bool add(E e);

  /// return `true` jika [e] ada seblumnya di `this`.
  @override
  bool remove(E e);

  MutableSet<E> subSet([int elementCount]);
}