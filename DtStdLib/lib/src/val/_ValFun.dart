extension ComparableExt<E extends Comparable> on E {
  bool operator >(E other) => compareTo(other) > 0;
  bool operator <(E other) => compareTo(other) < 0;
  bool isSameOrdered(E other) => compareTo(other) == 0;
  bool operator >=(E other) => this > other || isSameOrdered(other);
  bool operator <=(E other) => this < other || isSameOrdered(other);
}