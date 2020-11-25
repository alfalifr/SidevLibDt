import 'SimpleIterator.dart';
import '../val/Vals.dart';

extension IteratorExt<E> on Iterator<E> {
  Iterator<O> map<O>(O Function(E currInput) mapper) => MappingIterator(
    this, (E currInput) => mapper(currInput)
  );

  Iterator<IndexedValue<E>> withIndex() => IndexingIterator(this);
}