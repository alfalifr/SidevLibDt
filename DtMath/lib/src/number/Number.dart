/// Kelas akar untuk semua tipe data berupa angka di library ini.
/// Penggunaan kelas ini untuk mengakomodasi batasan dari dart yg melarang extends [num].
abstract class Number<T extends Number<T>> extends Comparable<T> {
  int toInt();
  double toDouble();
}