extension ComparableExt<E extends Comparable<E>> on E {
  bool operator >(E other) => compareTo(other) > 0;
  bool operator <(E other) => compareTo(other) < 0;
  bool isSameOrdered(E other) => compareTo(other) == 0;
  bool operator >=(E other) => this > other || isSameOrdered(other);
  bool operator <=(E other) => this < other || isSameOrdered(other);
}