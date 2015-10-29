package vmort.util;

using Lambda;
using StringTools;

class Strings {
  public static function isEmpty(input : String) : Bool {
    return input == null || input.length == 0;
  }

  public static function isFull(input : String) : Bool {
    return !isEmpty(input);
  }

  public static function splitTrim(input : String, ?delimiter : String = " \t") : Array<String> {
    var regex = new EReg(delimiter, "gi");
    return regex.split(input)
      .map(function(part) {
        return part.trim();
      })
      .filter(function(part) {
        return isFull(part);
      });
  }
}
