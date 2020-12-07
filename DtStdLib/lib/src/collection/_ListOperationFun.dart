import 'ListImpl.dart';
import 'List.dart';
import '_IterableFun.dart';
import '../exception/ElementExc.dart';
import '../range/_ProgressionFun.dart';

extension ListOperation_Iterable<T> on Iterable<T> {
  List_<T> operator +(Iterable<T> other){
    var list= toMutableList().subList(0);
    list.addAll(other);
    return list;
  }
  List_<T> operator -(Iterable<T> other){
    var list= toMutableList().subList(0);
    list.removeAll(other);
    return list;
  }

  /// [allowDuplicate] :
  /// -`true`, maka [other] tidak akan diubah menjadi set, artinya anggota duplikat pada [other] dipertahankan.
  /// Contoh: `this` == [1,2,3,5,2], [other] == [1,1,2,3,4,3], `hasil` == [1,2,3,5,2, 1,4,3].
  /// -`false`, maka [other] akan diubah menjadi set, artinya anggota pada [other] tidak terdapat duplikat.
  /// Contoh: `this` == [1,2,3,5,2], [other] == [1,1,2,3,4,3], `hasil` == [1,2,3,5,2, 4].
  List_<T> union(Iterable<T> other, [bool allowDuplicate = true]){
    var list= toMutableList().subList(0);
    if(allowDuplicate){
      var otherList= other.toMutableList().subList(0);
      otherList.removeAll(list);
      list.addAll(otherList);
    } else {
      var otherSet= other.toMutableSet().subSet();
      otherSet.removeAll(list);
      list.addAll(otherSet);
    }
    return list;
  }

  /// [withRemoval] :
  /// -`true`, maka semua elemen pada `this` yg cocok dengan elemen pada [other]
  /// akan dipertahankan berdasarkan jml elemen pada [other].
  /// Contoh: `this` == [1,2,3,4,2,3,5,2], [other] == [1,1,2,3,2], `hasil` == [1,2,3,2].
  /// -`false`, maka semua elemen pada `this` yg cocok dengan elemen pada [other]
  /// semuanya akan dipertahankan.
  /// Contoh: `this` == [1,2,3,4,2,3,5,2], [other] == [1,1,2,3,2], `hasil` == [1,2,3,2,3,2].
  List_<T> intersect(Iterable<T> other, [bool withRemoval = true]){
    MutableList<T> list; //= subList(0).toMutableList();
    var otherList= other.toMutableList().subList(0);
    if(withRemoval){
      list= mutableListOf([]);
      for(var e in this){
        if(otherList.contains(e)){
          list.add(e);
          otherList.remove(e);
        }
      }
    } else {
      list= toMutableList().subList(0);
      list.retainAll(otherList);
    }
    return list;
  }

  /// Mengambil [union] dari `this` dan [other] lalu menguranginya dg [intersect].
  /// [withNormalCount]
  /// -`true`, maka semua setiap elemen pada `this` maupun [other] akan diperhatikan semua
  /// sbg elemen yg unik dan duplikasi dipertahankan. Operasi pun dilakukan berdasarkan jml yg ada, bkn mempertahankan semua
  /// maupun meniadakan duplikasi. [withNormalCount] == `true` maka fungsi [intersect] dan [union] dipanggil dg parameter `bool` `true`.
  /// Contoh: `this` == [1,2,3,5,2], [other] == [1,1,2,3,4,3],
  /// `union` == [1,2,3,5,2, 1,4,3], `intersect` == [1,2,3], `hasil` == [5,2, 1,4,3].
  /// -`false`
  /// Contoh: `this` == [1,2,3,5,2], [other] == [1,1,2,3,4,3],
  /// `union` == [1,2,3,5,2, 4], `intersect` == [1,2,3,2], `hasil` == [5, 4].
  List_<T> counterIntersect(Iterable<T> other, [bool withNormalCount = true]){
    var otherList= other.toMutableList();

    MutableList<T> intersection= intersect(otherList.subList(0), withNormalCount);
    MutableList<T> union_= union(otherList.subList(0), withNormalCount);

    return union_ - intersection;
  }

  T reduceRight(T Function(T acc, T) combine){
    if(isEmpty) throw ElementExc.noElement();
    final list= toList_();

    final lastInd= list.size -1;
    var res= list[lastInd];

    for(var i in (lastInd-1).downTo(0)){
      res= combine(res, list[i]);
    }
    return res;
  }

  R fold<R>(R init, R Function(R acc, T) combine){
    if(isEmpty) throw ElementExc.noElement();
    final itr= iterator;
    var res= init;
    while(itr.moveNext()) {
      res= combine(res, itr.current);
    }
    return res;
  }
  R foldRight<R>(R init, R Function(R acc, T) combine){
    if(isEmpty) throw ElementExc.noElement();
    final list= toList_();

    final lastInd= list.size -1;
    var res= init;

    for(var i in lastInd.downTo(0)){
      res= combine(res, list[i]);
    }
    return res;
  }

  List_<R> scan<R>(R init, R Function(R acc, T) combine){
    if(isEmpty) throw ElementExc.noElement();
    final itr= iterator;
    var res= init;
    final list= mutableListOf<R>([init]);
    while(itr.moveNext()) {
      res= combine(res, itr.current);
      list.add(res);
    }
    return list;
  }
  List_<R> scanRight<R>(R init, R Function(R acc, T) combine){
    if(isEmpty) throw ElementExc.noElement();
    final list= toList_();

    final lastInd= list.size -1;
    var res= init;
    final resList= mutableListOf<R>([init]);

    for(var i in lastInd.downTo(0)){
      res= combine(res, list[i]);
      resList.add(res);
    }
    return resList;
  }
}