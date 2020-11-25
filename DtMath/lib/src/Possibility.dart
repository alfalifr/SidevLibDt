import 'Factorization.dart';

/// Permutasi untuk [n] item yang diambil sebanyak [r] item dalam waktu bersamaan.
/// Permutasi adalah banyak kemungkinan yang memperhatikan urutan item.
int permutation(int n, [int r]) => factorial(n) ~/ factorial(n-(r ?? n));

/// Kombinasi untuk [n] item yang diambil sebanyak [r] item dalam waktu bersamaan.
/// Kombinasi adalah banyak kemungkinan yang tidak memperhatikan urutan item.
int combination(int n, [int r]) => factorial(n) ~/ (factorial(n-(r ?? n)) * factorial(r ?? n));

/// Kemungkinan banyaknya handshake yg terjadi pada kumpulan orang berjumlah [n].
int possibleHandshakes(int n) => (n * (n-1)) ~/ 2;

/// Kemungkinan semua rute yang terdiri dari [n] node.
/// Fungsi ini enganggap semua node saling terhubung.
int possibleRoutes(int n) => factorial(n-1) ~/ 2;