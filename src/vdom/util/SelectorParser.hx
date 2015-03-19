package vdom.util;
using Lambda;

class SelectorParser {
  static var classIdSplit(default, never) : EReg = ~/([\.#]?[a-zA-Z0-9_:-]+)/;
  static var notClassId(default, never) : EReg = ~/^\.|#/;
  static var defaultTagName : String = 'DIV';

  public static function parse(?selector : String, ?properties : Properties) : String {
    if (selector == null)
      return defaultTagName;

    if (properties == null)
      properties = {};

    var noId = properties.id == null;

    var selectorParts = classIdSplit.split(selector);
    var tagName = null;

    if (!notClassId.match(selectorParts)) {
      tagName = defaultTagName;
    }

    var classes, part, type, i;

    selectorParts.iter(function(part) {
      var first = part.charAt(0);

    });


  }
}
