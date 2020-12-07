import 'package:DtStdLib/src/number/_NumberComparisonFun.dart';
import 'package:DtStdLib/src/val/Enums.dart';
import '../collection/_IterableFun.dart';
import '../collection/List.dart';
import '../range/_ProgressionFun.dart';


extension Sort_MutableListExt<T> on MutableList<T> {
    void swap(int i, int u) {
        final tmp= this[i];
        this[i]= this[u];
        this[u]= tmp;
    }

    void selectionSortDescendingBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until]
    ) => selectionSortBy(toComparableFun, from, until, Order.DESC);
    void selectionSortBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until,
        Order order = Order.ASC]
    ){
        final replaceFun= order == Order.ASC ? moreThan_<R>() : lessThan_<R>();
        final from_= from ?? 0;
        final until_= until ?? size;
    //        if(order == Order.ASC) { n1, n2 -> n1 > n2 } else { n1, n2 -> n1 < n2 }
        for(final i in from_.until(until_)){
            var iVal= this[i];
            var iValComparable= toComparableFun(iVal);
            for(final u in (i+1).until(until_)){
                final uVal= this[u];
//                print("iVal= $iVal uVal= $uVal iValComparable= $iValComparable toComparableFun(uVal)= ${toComparableFun(uVal)} i= $i u= $u");
                if(replaceFun(iValComparable, toComparableFun(uVal))){
                    this[i]= uVal;
                    this[u]= iVal;
                    iVal= uVal;
                    iValComparable= toComparableFun(iVal);
                }
            }
        }
    }

    void insertionSortDescendingBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until]
    ) => insertionSortBy(toComparableFun, from, until, Order.DESC);
    void insertionSortBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until,
        Order order = Order.ASC]
    ){
        final replaceFun = order == Order.ASC ? moreThan_<R>() : lessThan_<R>();
        final from_= from ?? 0;
        final until_= until ?? size;
        for(final i in from_.until(until_-1)){
            final tailVal= this[i+1];
            final tailValComparable= toComparableFun(tailVal);
            if(replaceFun(toComparableFun(this[i]), tailValComparable)){
                var head= from_;
                for(final u in i.downTo(from_)){
                    final uVal= this[u];
                    if(replaceFun(tailValComparable, toComparableFun(uVal))){
                        head= u+1;
                        break;
                    }
                    this[u+1]= uVal;
                }
                this[head]= tailVal;
            }
        }
    }

    void mergeSortDescendingBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until]
    ) => mergeSortBy(toComparableFun, from, until, Order.DESC);
    void mergeSortBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until,
            Order order = Order.ASC]
    ){
        final checkFun= order == Order.ASC ? lessThanEqual_<R>() : moreThanEqual_<R>();

        void merge(int left, int middle, int right){
//        prine("mergeSort.merge() left= $left right= $right size= $size")
            var all= left;
            var l= 0;
//        val mid= (left + right) ushr 1
            var r= 0; //(right - left) ushr 1

            final nl= middle - left +1; //Ditambah 1 agar saat pembagian array dg size 2 dapat dibagi menjadi 1 dan 1.
            final nr= right - middle; //+ 1
            final lArrOuterIndex= middle +1;

//        print("mergeSort.merge() left= $left right= $right nl= $nl nr= $nr l= $l r= $r mid= $middle lArrOuterIndex= $lArrOuterIndex");

            final lArr= copy(left, lArrOuterIndex); //copyOfRange(left, lArrOuterIndex);
//            print("mergeSort.merge() lArr= '$lArr'");
            final rArr= copy(lArrOuterIndex, right +1);
//            print("mergeSort.merge() rArr= '$rArr'");

            if(l < nl && r < nr){
                var lVal= lArr[l];
                var rVal= rArr[r];
                while(l < nl && r < nr){
//                prine("mergeSort.merge() lVal= $lVal rVal= $rVal")
                    if(checkFun(toComparableFun(lVal), toComparableFun(rVal))){
                        this[all++]= lVal;
                        if(++l < nl) {
                          lVal= lArr[l];
                        }
                    } else {
                        this[all++]= rVal;
                        if(++r < nr) {
                          rVal= rArr[r];
                        }
                    }
                }
            }

//        prine("mergeSort.merge() left= $left right= $right l= $l r= $r m= $middle all= $all nl= $nl nr= $nr")

            while(l < nl) {
                this[all++]= lArr[l++];
            }
//                .also { prine("mergeSort.merge() lVal= $it") }

            while(r < nr){
                this[all++]= rArr[r++];
            }
//                .also { prine("mergeSort.merge() rVal= $it") }

//        if(all < right){ }
        }

        void sort(int left, int right){
    //        prine("mergeSort.sort() AWAL l= $left r= $right size= $size this= ${joinToString()}")
            if(left >= right) return;
            final mid= (left + right) >> 1;
//            print("mergeSort.sort() l= $left r= $right mid= $mid");
            sort(left, mid); //Sort left part
            sort(mid+1, right); //Sort right part
            merge(left, mid, right);
    //        prine("mergeSort.sort() AKHIR this= ${joinToString()}")
        }
        sort(from ?? 0, (until ?? size) - 1);
    }

    void quickSortDescendingBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until]
   ) => quickSortBy(toComparableFun, from, until, Order.DESC);
    void quickSortBy<R extends Comparable>(
        R Function(T) toComparableFun,
        [int from, int until,
            Order order = Order.ASC]
    ){
        final replaceFun= order == Order.ASC ? lessThan_<R>() : moreThan_<R>();

        /**
         * Return index dari pembatas partisi.
         */
        int partition(int left, int right) {
    //        prine("quickSort.partition() left= $left right= $right")
            final lastVal= this[right];
            final lastValComparable= toComparableFun(lastVal);

            var swapIndex= left; //-1
            for(final i in left.until(right)){
                if(replaceFun(toComparableFun(this[i]), lastValComparable)){
                    final temp= this[i];
                    this[i]= this[swapIndex];
                    this[swapIndex++]= temp;
                }
            }
    //        swap(swapIndex, right)
            final temp= this[swapIndex];
            this[swapIndex]= lastVal;
            this[right]= temp;
            return swapIndex;
        }

        void sort(int left, int right){
            if(left >= right) return;
            final mid= partition(left, right); //(left + right) ushr 1
            if(mid > 0) {
              sort(left, mid-1);
            }
            sort(mid+1, right);
        }

        sort(from ?? 0, (until ?? size) -1);
    }
}

extension Sort_MutableListExt_Comparable<T extends Comparable> on MutableList<T> {
    void selectionSort([int from, int until, Order order = Order.ASC]) => selectionSortBy<T>((it) => it, from, until, order);
    void selectionSortDescending([int from, int until]) => selectionSortBy((it) => it, from, until, Order.DESC);
    void insertionSort([int from, int until, Order order = Order.ASC]) => insertionSortBy((it) => it, from, until, order);
    void insertionSortDescending([int from, int until]) => insertionSortBy((it) => it, from, until, Order.DESC);
    void mergeSort([int from, int until, Order order = Order.ASC]) => mergeSortBy((it) => it, from, until, order);
    void mergeSortDescending([int from, int until]) => mergeSortBy((it) => it, from, until, Order.DESC);
    void quickSort([int from, int until, Order order = Order.ASC]) => quickSortBy((it) => it, from, until, order);
    void quickSortDescending([int from, int until]) => quickSortBy((it) => it, from, until, Order.DESC);
}


// inline fun <R: Comparable<R>> inlineCompareFun(func: (R, R) -> Boolean, n1: R, n2: R): Boolean = func(n1, n2)


//1,2,4,1,5,1,5,12,42,23,11,10,15,14
//0 1 2 3 4 5 6 7  8  9  10 11 12 13 //14
//l           r
//


