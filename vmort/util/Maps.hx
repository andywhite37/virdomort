package vmort.util;

using vmort.util.Iterators;

class Maps {
  public static function size<K, V>(map : Map<K, V>) : Int {
    return map.keys().toArray().length;
  }

  public static function isEmpty<K, V>(map : Map<K, V>) : Bool {
    return map == null || size(map) == 0;
  }

  public static function isFull<K, V>(map : Map<K, V>) : Bool {
    return !isEmpty(map);
  }
}
