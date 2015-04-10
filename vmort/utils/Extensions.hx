package vmort.utils;

using Lambda;

class Extensions {
  public static function equals<T>(a : T, b : T) : Bool {
    return a == b;
  }

  public static function contains<T>(array : Array<T>, value : T, ?predicate : T -> T -> Bool) : Bool {
    if (predicate == null) predicate = equals;

    return array.find(function(a) {
      return predicate(a, value);
    }) != null;
  }

  public static function unique<T>(array : Array<T>, ?predicate : T -> T -> Bool) : Array<T> {
    if (predicate == null) predicate = equals;

    return array.fold(function(acc : Array<T>, a : T) {
      if (!contains(acc, a, predicate)) {
        acc.push(a);
      }
      return acc;
    }, []);
  }

  public static function intersect<T>(left : Array<T>, right : Array<T>, ?predicate : T -> T -> Bool) : Array<T> {
    if (predicate == null) predicate = equals;

    return unique(left).fold(function(acc : Array<T>, a : T) {
    }, []);
  }

  public static function difference<T>(left : Array<T>, right : Array<T>, ?predicate : T -> T -> Bool) : Array<T> {
    if (predicate == null) predicate = equals;
    var result = [];

    var intersection = intersect(left, right, predicate);

    var leftu = unique(left, predicate);

    for (l in leftu) {

    }


  }
}
