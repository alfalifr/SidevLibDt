import 'package:DtMath/DtMath.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Awesome awesome;

    setUp(() {
      awesome = Awesome();
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });

    test('KPK Test', () {
      final a= 12;
      final b= 20;
      final kpk= a.kpk(b);
      final fpb= a.fpb(b);

      print("a= $a b= $b kpk= $kpk fpb= $fpb");
    });

    test('Fraction Test', () {
      final fr1= fractionOf(12, 20);
      final fr2= fractionOf(10, 12);
      final fr3= fractionOf(36, 60);
      final fr4= floatingFractionOf(0.15, 0.25);
      final fr5= floatingFractionOf(0.7, 0.20);
      final fr6= 1.25.toFraction();

      print("fr1= $fr1 realNumber= ${fr1.realNumber} simply= ${fr1.simply()}");
      print("fr2= $fr2 realNumber= ${fr2.realNumber} simply= ${fr2.simply()}");
      print("fr3= $fr3 realNumber= ${fr3.realNumber} simply= ${fr3.simply()}");
      print("fr4= $fr4 realNumber= ${fr4.realNumber} simply= ${fr4.simply()} intFraction= ${fr4.toIntFraction()}");
      print("fr5= $fr5 realNumber= ${fr5.realNumber} simply= ${fr5.simply()} intFraction= ${fr5.toIntFraction()}");
      print("fr6= $fr6 realNumber= ${fr6.realNumber} simply= ${fr6.simply()}");

      print("fr1 == fr3 = ${fr1 == fr3}");

      print("fr1.makeCommonFractions(fr2) = ${fr1.makeCommonFractions(fr2)}");
      print("fr4.makeCommonFractions(fr5) = ${fr4.makeCommonFractions(fr5)}");

      print("fr1 > fr2 => ${fr1 > fr2}");
      print("fr1 < fr2 => ${fr1 < fr2}");

      print("fr1 + fr2 = ${fr1 + fr2}");
      print("fr1 * fr2 = ${fr1 * fr2}");
      print("fr1 / fr2 = ${fr1 / fr2}");
      print("fr1 + 2 = ${fr1.plus(2)}");
    });

  });
}