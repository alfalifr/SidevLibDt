import 'package:DtStdLib/DtStdLib.dart';

extension ScopeFun<T> on T {
  T also(Function(T it) block){
    block(this);
    return this;
  }

  R let<R>(R Function(T it) block) => block(this);

  T notNull(Function(T it) block) {
    if(this != null) {
      block(this);
    }
    return this;
  }

  R notNullTo<R>(R Function(T it) block) {
    if(this != null) {
      return block(this);
    }
    return null;
  }

  T isNull(T Function() block) {
    if(this == null){
      block();
    }
    return this;
  }

  T asNotNull<R>(Function(R it) block) {
    if(this != null && this is R) {
      block(this as R);
    }
    return this;
  }
  T asntNotNull<R>(Function(Object it) block) {
    if(this != null && this is! R) {
      block(this);
    }
    return this;
  }

  @nullable
  R asNotNullTo<T2, R>(R Function(T2 it) block) {
    if(this != null && this is T2) {
      return block(this as T2);
    }
    return null;
  }

  @nullable
  R asntNotNullTo<T2, R>(R Function(Object it) block) {
    if(this != null && this is! T2) {
      return block(this);
    }
    return null;
  }
}