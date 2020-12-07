import 'package:DtStdLib/DtStdLib.dart';
import 'package:DtStdLib/src/val/Enums.dart';
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
    
    test('Range Test', () {
      print("until()");
      for(var i in 0.until(10)){
        print("i= $i");
      }
      print("until() 2");
      for(var i in 1.until(2)){
        print("i= $i");
      }
      print("ranges()");
      for(var i in 0.ranges(10)){
        print("i= $i");
      }
    });

    test('List Test', (){
      var list= listOf([1,2,3,4]);
      var mutList= list.toMutableList();
      


      print("list= $list");
      print("mut list before= $mutList");
      mutList[2]= 5;
      print("mut list after= $mutList");
      mutList.addAll([12,14,15], 2);
      print("mut list after 2= $mutList");
    });

    test('Map Test', (){
      var map= {'a':1, 'b':2}.toMap_();
      var mutMap= map.toMutableMap();
      mutMap['d']= 1;

      print("map simple = $map");
      print("mutable map = $mutMap");

      mutMap.addMap({'z':12, 's':15});
      print("mutable map after = $mutMap");
    });

    test('Scope Test', (){
      var map= {'a':1, 'b':2}.let((m) => true);
    });

    test('float test', (){
      var i= 123.123;
      print(i - i.toInt());
      var str= i.toString();
      var dotInd= str.indexOf('.');
      print(str.length - dotInd -1);
    });
  });

  test('Sort Test', (){
    final ls= [1, 2, 4, 1, 5, 1, 5, 12, 42, 23, 11, 10, 15, 14].toMutableList(); //[1,3,1,5,6,7,1,12,2,3,31,21,42].toMutableList();
    print("ls= $ls");

    final ind1= ls.binarySearch(42);
    print("ind1= $ind1");

    ls.add(101, 3);
    print("ls= $ls");
    ls.quickSortDescendingBy((it) => it);
    print("ls= $ls");
    ls.quickSort();
    print("ls= $ls");

    final ind2= ls.binarySearch(42);
    print("ind2= $ind2");
  });
}
