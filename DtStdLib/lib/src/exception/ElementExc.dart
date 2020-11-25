import 'Exc.dart';

class ElementExc extends Exc {
  factory ElementExc([message]) => Exc(message);

  static ElementExc noElement() => ElementExc("No element");
  static ElementExc tooMany() => ElementExc("Too many elements");
  static ElementExc tooFew() => ElementExc("Too few elements");
}