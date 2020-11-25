import 'package:DtStdLib/DtStdLib.dart';

extension CollectionExt<E> on Collection<E> {
  Collection<E> toCollection() => this;
  MutableCollection<E> toMutableCollection() {
    if(this is MutableCollection) return this;
    if(this is Set_) return toMutableSet();
    if(this is List_) return toMutableList();
    if(this is Map_) return (this as Map_).toMutableMap() as MutableCollection<E>;
    return toMutableSet();
  }
}