
import '../collection/List.dart';

extension Search_ListExt<T> on List_<T> {
    int binarySearchBy<R extends Comparable>(
        T e,
        R Function(T) toComparableFun,
        [int from= 0, int until]
    ) => binarySearchComparison((it) => toComparableFun(it).compareTo(toComparableFun(e)), from, until);

    int binarySearchWith(
        T e, Comparator<T> comparator,
        [int from= 0, int until]
    ) => binarySearchComparison((it) => comparator(it, e), from, until);

    int binarySearchComparison(
        int Function(T midVal) compareFun,
        [int from= 0, int until]
    ) {
//    sidev.lib.collection.rangeCheck(size, from, until)
        final until_= until ?? size;
        var index= -1;
        var low= from;
        var high= until_ -1;

        while(low <= high){
            final mid= (low + high) >> 1;
            final midVal= this[mid];
            final cmp= compareFun(midVal);
            if(cmp == 0){
                index = mid;
                break;
            } else if(low == high){
                return -1;
            } else if(cmp > 0){
                high= mid -1;
            } else /*if(cmp < 0)*/ {
                low= mid +1;
            }
        }
        return index;
    }
}

extension Search_ListExt_Comparable<T extends Comparable> on List_<T> {
    int binarySearch(
        T e, [int from= 0, int until]
    ) => binarySearchComparison((it) => it.compareTo(e), from, until);
}




/*

fun <T, R: Comparable<R>> Array<T>.binarySearchBy(
        e: T, from: Int= 0, until: Int= size, toComparableFun: (T) -> R
): Int = binarySearch(from, until) { toComparableFun(it).compareTo(toComparableFun(e)) }

fun <T: Comparable<T>> Array<T>.binarySearch(
        e: T, from: Int= 0, until: Int= size
): Int = binarySearch(from, until) { it.compareTo(e) }

fun <T> Array<T>.binarySearch(
    e: T, comparator: Comparator<T>,
    from: Int= 0, until: Int= size
): Int  = binarySearch(from, until) { comparator.compare(it, e) }

fun <T> Array<T>.binarySearch(
        from: Int= 0, until: Int= size, compareFun: (midVal: T) -> Int
): Int {
    sidev.lib.collection.rangeCheck(size, from, until)

    var index= -1
    var low= from
    var high= until -1

    @Suppress(SuppressLiteral.UNCHECKED_CAST)
    while(low <= high){
        val mid= (low + high) ushr 1
        val midVal= this[mid]
        val cmp= compareFun(midVal)
        when {
            cmp == 0 -> {
                index = mid
                break
            }
            low == high -> return -1
            cmp > 0 -> high= mid -1
            cmp < 0 -> low= mid +1
        }
    }
    return index
}
 */