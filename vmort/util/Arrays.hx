package vmort.util;

import vmort.util.Objects;
using Lambda;

class Arrays {
  public static function isEmpty<T>(array : Array<T>) : Bool {
    return array == null || array.length == 0;
  }

  public static function isFull<T>(array : Array<T>) : Bool {
    return !isEmpty(array);
  }

  public static function contains<T>(array : Array<T>, value : T, ?predicate : T -> T -> Bool) : Bool {
    if (predicate == null)
      predicate = Objects.equals;

    return array.find(function(a) {
      return predicate(a, value);
    }) != null;
  }

  public static function unique<T>(array : Array<T>, ?predicate : T -> T -> Bool) : Array<T> {
    return array.fold(function(a : T, acc : Array<T>) {
      if (!contains(acc, a, predicate)) {
        acc.push(a);
      }
      return acc;
    }, []);
  }

  public static function intersection<T>(left : Array<T>, right : Array<T>, ?predicate : T -> T -> Bool) : Array<T> {
    var uleft = unique(left, predicate);
    var uright = unique(right, predicate);

    return uleft.fold(function(l : T, acc : Array<T>) {
      if (contains(uright, l, predicate)) {
        acc.push(l);
      }
      return acc;
    }, []);
  }

  public static function difference<T>(left : Array<T>, right : Array<T>, ?predicate : T -> T -> Bool) : Array<T> {
    var uleft = unique(left, predicate);
    var uright = unique(right, predicate);

    return uleft.fold(function(l : T, acc : Array<T>) {
      if (!contains(uright, l, predicate)) {
        acc.push(l);
      }
      return acc;
    }, []);
  }

  public static function diff<T>(left : Array<T>, right : Array<T>, ?predicate : T -> T -> Bool) {
    return {
      left: difference(left, right, predicate),
      both: intersection(left, right, predicate),
      right: difference(right, left, predicate)
    };
  }
}
