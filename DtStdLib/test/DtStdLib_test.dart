import 'package:DtStdLib/DtStdLib.dart';
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
}
