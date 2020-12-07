import '_OpFun.dart';
import '_DigitFun.dart';

extension NumberFun_NumExt<T extends num> on T {
  bool isFloatingType() => this is double;

  /// Menghilangkan tanda desimal (titik) pada angka dg format floating
  /// dg cara mengalikan 10 ^ jml digit di belakang tanda desimal.
  int getRidOfDecimal() {
    final factor= 10.powCast(getDigitBehindDecimal());
    return (this * factor).toInt();
  }

  /// Menghilangkan tanda desimal (titik) pada angka dg format floating
  /// dg cara mengalikan 10 ^ jml digit di belakang tanda desimal.
  ///
  /// Properti ini sama dg [getRidOfDecimal], namun lebih praktis karena singkat.
  int get noDecimalValue => getRidOfDecimal();
}