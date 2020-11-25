import 'package:DtStdLib/DtStdLib.dart';

class IndexingIterable<E> extends Iterable<IndexedValue<E>> {
  IndexingIterable(this._itr);

  Iterable<E> _itr;

  @override
  Iterator<IndexedValue<E>> get iterator => IndexingIterator(_itr.iterator);
}