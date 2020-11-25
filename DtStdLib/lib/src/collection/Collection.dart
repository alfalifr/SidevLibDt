abstract class Collection<E> extends Iterable<E>{
  int get size;
  bool contains_(E e);
}

abstract class MutableCollection<E> extends Collection<E>{
  /// return `true` jika terjadi modifikasi pada elemen dalam `this`.
  bool add(E e);

  /// return `true` jika terjadi modifikasi pada elemen dalam `this`.
  bool addAll(Iterable<E> es);

  /// return `true` jika terjadi modifikasi pada elemen dalam `this`.
  bool remove(E e);

  /// return `true` jika terjadi modifikasi pada elemen dalam `this`.
  bool removeAll(Iterable<E> es);

  /// return `true` jika terjadi modifikasi pada elemen dalam `this`.
  bool retainAll(Iterable<E> es);
}