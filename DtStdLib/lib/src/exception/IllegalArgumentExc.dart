import 'Exc.dart';

class IllegalArgumentExc extends Exc {
  factory IllegalArgumentExc([argName = "<arg>", detMsg = "Argumen yang di-pass salah"]) =>
      Exc("$detMsg, argName= $argName");
}