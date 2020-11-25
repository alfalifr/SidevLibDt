
typedef _FunctionWithArguments = dynamic Function(List<dynamic> positionalArguments, Map<Symbol, dynamic> namedArguments);

class VarargFun {
  final _FunctionWithArguments function;
  VarargFun(this.function);

  @override
  dynamic noSuchMethod(Invocation invocation) {
    if(invocation.isMethod && invocation.memberName == const Symbol('call')) {
      return function(invocation.positionalArguments, invocation.namedArguments);
    }

    return;
  }
}