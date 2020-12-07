import '../val/_ValFun.dart';
/*
========== Universal Comparison ==============
Digunakan untuk komparasi antar tipe data. Tidak direkomendasikan digunakan di luar library ini.
==============================================
*/
bool univLessThan<T extends Comparable>(T i1, T i2) {
        try{ return i1 < i2; }
        on TypeError{ return (i1 as Comparable).compareTo(i2 as Comparable) < 0; }
}
bool univLessThanEqual<T extends Comparable>(T i1, T i2) {
        try{ return i1 <= i2; }
        on TypeError{ return (i1 as Comparable).compareTo(i2 as Comparable) <= 0; }
}
bool univMoreThan<T extends Comparable>(T i1, T i2) {
        try{ return i1 > i2; }
        on TypeError{ return (i1 as Comparable).compareTo(i2 as Comparable) > 0; }
}
bool univMoreThanEqual<T extends Comparable>(T i1, T i2) {
        try{ return i1 >= i2; }
        on TypeError{ return (i1 as Comparable).compareTo(i2 as Comparable) >= 0; }
}

bool univAsc<T extends Comparable>(T i1, T i2) => univLessThan(i1,  i2);
bool univDesc<T extends Comparable>(T i1, T i2) => univMoreThan(i1,  i2);


//================ Uni Comparison ===================

bool Function(T, T) lessThan_<T extends Comparable>() => (i1, i2) => i1 < i2;
bool Function(T, T) lessThanEqual_<T extends Comparable>() => (i1, i2) => i1 <= i2;
bool Function(T, T) moreThan_<T extends Comparable>() => (i1, i2) => i1 > i2;
bool Function(T, T) moreThanEqual_<T extends Comparable>() => (i1, i2) => i1 >= i2;
/*
bool Function(T, T) lessThan__<T extends Comparable>() => (i1, i2) => i1 < i2;
bool Function(T, T) lessThanEqual__<T extends Comparable>() => (i1, i2) => i1 <= i2;
bool Function(T, T) moreThan__<T extends Comparable>() => (i1, i2) => i1 > i2;
bool Function(T, T) moreThanEqual_<T extends Comparable<T>>() => (i1, i2) => i1 >= i2;
 */

bool lessThan<T extends Comparable>(T i1, T i2) => i1 < i2;
bool lessThanEqual<T extends Comparable>(T i1, T i2) => i1 <= i2;
bool moreThan<T extends Comparable>(T i1, T i2) => i1 > i2;
bool moreThanEqual<T extends Comparable>(T i1, T i2) => i1 >= i2;

bool asc<T extends Comparable>(T i1, T i2) => lessThan(i1,  i2);
bool desc<T extends Comparable>(T i1, T i2) => moreThan(i1,  i2);

