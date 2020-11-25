import 'package:DtStdLib/DtStdLib.dart';

import '../annotation/Nullability.dart';

class SimpleIterator<E> extends Iterator<E> {
  SimpleIterator(this.hasNext, this.next);

  bool Function(int i, @nullable E before) hasNext;
  E Function(int i, @nullable E before) next;

  @nullable
  E _before;

  int _currIndex = 0;

  @override
  bool moveNext() => hasNext(_currIndex, _before);

  @override
  E get current => _before = next(_currIndex++, _before);
}

class SimpleIteratorWrapper<E> extends Iterator<E> {
  SimpleIteratorWrapper(this._itr);

  Iterator<E> _itr;

  @override
  bool moveNext() => _itr.moveNext();

  @override
  E get current => _itr.current;
}

class MappingIterator<I, O> extends Iterator<O> {
  MappingIterator(this._itr, this._mapper);

  Iterator<I> _itr;
  O Function(I currInput) _mapper;

  @override
  bool moveNext() => _itr.moveNext();

  @override
  O get current => _mapper(_itr.current);
}

class IndexingIterator<E> extends Iterator<IndexedValue<E>> {
  IndexingIterator(this._itr);

  Iterator<E> _itr;
  int _i = 0;

  @override
  bool moveNext() => _itr.moveNext();

  @override
  IndexedValue<E> get current => IndexedValue(_i++, _itr.current);
}

