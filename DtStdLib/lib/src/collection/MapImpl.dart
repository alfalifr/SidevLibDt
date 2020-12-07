import '_IterableFun.dart';
import 'Collection.dart';
import 'Map.dart';
import '../iterator/_IteratorFun.dart';
import '../scope/_ScopeFun.dart';

Map_<K, V> mapOfEntries<K, V>(Iterable<MapEntry<K, V>> entries) => <K, V>{}.let((m){
  m.addEntries(entries);
  return _MutableMapImpl(m);
});
Map_<K, V> mapOf<K, V>(Map<K, V> map) => _MutableMapImpl(map);

MutableMap<K, V> mutableMapOfEntries<K, V>(Iterable<MapEntry<K, V>> entries) => <K, V>{}.let((m){
  m.addEntries(entries);
  return _MutableMapImpl(m);
});
MutableMap<K, V> mutableMapOf<K, V>(Map<K, V> map) => _MutableMapImpl(map);

Map<K, V> toSimpleMap<K, V>(Map_<K, V> map_) {
  if(map_ is _MutableMapImpl){
    return (map_ as _MutableMapImpl).content;
  }

  var map= {};
  for(var entry in map_){
    map[entry.key]= entry.value;
  }
  return map;
}

class _MutableMapImpl<K, V> extends MutableMap<K, V> {
  _MutableMapImpl([this.content]){
    content ??= {};
  }

  Map<K, V> content;

  @override
  Set<K> get keys => content.keys.toSet();

  @override
  Collection<V> get values => content.values.toList_();

  @override
  Set<MapEntry<K, V>> get entries => content.entries.toSet();

  @override
  int get size => content.length;

  @override
  Iterator<MapEntry<K, V>> get iterator => keys.iterator.map((K key) => MapEntry(key, this[key]));

  @override
  V operator [](K key) => content[key];

  @override
  void operator []=(K key, V value) => content[key]= value;

  @override
  bool contains_(MapEntry<K, V> e) => content.containsKey(e.key) && content.containsValue(e.value);

  @override
  bool containsKey(K key) => content.containsKey(key);

  @override
  bool containsValue(V value) => content.containsValue(value);

  @override
  bool add(MapEntry<K, V> e) {
    content.addEntries([e]);
    return true;
  }

  @override
  bool remove(MapEntry<K, V> e) {
    if(content[e.key] == e.value){
      content.remove(e.key);
      return true;
    }
    return false;
  }

  @override
  bool addAll(Iterable<MapEntry<K, V>> es, [bool replaceExisting = true]) {
    if(replaceExisting){
      for(var entry in es){
        content[entry.key]= entry.value;
      }
      return es.isNotEmpty;
    } else {
      var bool= false;
      for(var entry in es){
        if(!content.containsKey(entry.key)){
          content[entry.key]= entry.value;
          bool= true;
        }
      }
      return bool;
    }
  }

  @override
  bool addMap(Map<K, V> m, [bool replaceExisting = true]){
    if(replaceExisting){
      for(var key in m.keys){
        content[key]= m[key];
      }
      return m.isNotEmpty;
    } else {
      var bool= false;
      for(var key in m.keys){
        if(!content.containsKey(key)){
          content[key]= m[key];
          bool= true;
        }
      }
      return bool;
    }
  }

  @override
  bool removeAll(Iterable<MapEntry<K, V>> es) {
    var bool= false;
    for(var entry in es){
      bool |= content.remove(entry.key) != null;
    }
    return bool;
  }

  @override
  bool retainAll(Iterable<MapEntry<K, V>> es) {
    var set= es.toSet();
    var retainedList= {};
    for(var e in set){
      if(contains_(e)){
        retainedList[e.key]= e.value;
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