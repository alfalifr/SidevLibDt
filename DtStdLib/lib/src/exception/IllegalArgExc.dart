import 'Exc.dart';

class IllegalArgExc extends Exc {
  factory IllegalArgExc([argName = "<arg>", detMsg = "Argumen yang di-pass salah"]) =>
      Exc("$detMsg, argName= $argName");
}