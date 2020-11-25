import 'Collection.dart';
import '../annotation/Nullability.dart';

abstract class Map_<K, V> extends Collection<MapEntry<K, V>> {
  Set<K> keys;
  Collection<V> values;
  Set<MapEntry<K, V>> entries;

  @nullable
  V operator [](K key);
  bool containsKey(K key);
  bool containsValue(V value);
}
/*
class MapEntry<K, V> {
  final K key;
  final V value;

  MapEntry(this.key, this.value);
}
 */


abstract class MutableMap<K, V> extends Map_<K, V> implements MutableCollection<MapEntry<K, V>> {
  @nullable
  operator []=(K key, V value);

  /// Jika [replaceExisting] == `true`, maka `value` dg `key` dalam `this` akan digantikan dg
  /// `value` pada [es] jika terdapat `key` pada [es].
  @override
  bool addAll(Iterable<MapEntry<K, V>> es, [bool replaceExisting = true]);

  /// Jika [replaceExisting] == `true`, maka `value` dg `key` dalam `this` akan digantikan dg
  /// `value` pada [es] jika terdapat `key` pada [es].
  @override
  bool addMap(Map<K, V> m, [bool replaceExisting = true]);

  @override
  bool removeAll(Iterable<MapEntry<K, V>> es);
  @override
  bool retainAll(Iterable<MapEntry<K, V>> es);
}

/*
class MutableMapEntry<K, V> extends MapEntry<K, V> {
  final K key;
  V value;

  MutableMapEntry(this.key, this.value) : super(key, value);
}
 */