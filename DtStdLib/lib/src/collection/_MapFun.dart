import '_MapImpl.dart';
import 'Map.dart';

extension Object_MapEntryExt<K, V> on K {
  MapEntry<K, V> to(V value) => MapEntry(this, value);
}

extension MapExt<K, V> on Map<K, V> {
  Map_<K, V> toMap_() => mapOf(this);
  MutableMap<K, V> toMutableMap() => mapOf(this);
}

extension MapExt_<K, V> on Map_<K, V> {
  Map<K, V> toMap() => toSimpleMap(this);
  MutableMap<K, V> toMutableMap() {
    if(this is MutableMap) return this;
    return mutableMapOfEntries(this);
  }
}