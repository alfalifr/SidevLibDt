import 'Set.dart';
import '_SetImpl.dart';

extension SetExt_<E> on Set_<E> {
  Set<E> toSet() => toSimpleSet(this);
}