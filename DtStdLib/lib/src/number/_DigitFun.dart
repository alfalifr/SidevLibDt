import '_NumberFun.dart';
import '../scope/Scope.dart';

extension Digit_NumExt<T extends num> on T {
  int getDigitBehindDecimal() {
    if(!isFloatingType()) return 0;
    return toString().let((str_) {
      final decIndex= str_.indexOf(".");
      return (str_.length - decIndex - 1).let((it) {
        if(it == 1 && str_.length == 3 && str_[decIndex +1] == '0') {
          return 0;
        } else {
          return it;
        }
      });
    });
  }
}