package vmort.util;

class Iterators {
  public static function toArray<T>(i : Iterator<T>) : Array<T> {
    var result = [];
    while (i.hasNext()) {
      result.push(i.next());
    }
    return result;
  }
}
