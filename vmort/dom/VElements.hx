package vmort.dom;

import js.Browser;
import js.html.Element;
import js.html.Node;
using vmort.dom.Elements;
using vmort.util.Arrays;
using vmort.util.Strings;

class VElements {
  public static var V_ID_ATTRIBUTE_NAME(default, never) = "id";
  public static var V_CLASSES_ATTRIBUTE_NAME(default, never) = "classes";
  public static var V_STYLES_ATTRIBUTE_NAME(default, never) = "styles";

  public static function reify(velement : VElement<Node>) : Element {
    var element : Element = cast Browser.document.createElement(velement.tag);
    velement.setRef(element);
    element.addAttributes(velement.attributes);
    element.addEvents(velement.events);
    element.addChildren(velement.children);
    return element;
  }

  public static function setId(velement : VElement<Node>, id : ValOrFunc<String>) : VElement<Node> {
    return velement.addAttribute(V_ID_ATTRIBUTE_NAME, id.toValue());
  }

  public static function addClass(velement : VElement<Node>, className : ValOrFunc<String>) : VElement<Node> {
    var classes = getClasses(velement);
    var newClasses = className.toValue().trimSplit();
    for (newClass in newClasses) {
      if (!classes.contains(newClass)) {
        classes.push(newClass);
      }
    }
    return velement;
  }
  public static var cls(default, never) = addClass;

  public static function addClasses(velement : VElement<Node>, classNames : ValOrFunc<Array<String>>) : VElement<Node> {
    for (className in classNames.toValue()) {
      addClass(velement, className);
    }
    return velement;
  }

  public static function addClassIf(
      velement : VElement<Node>,
      conditional : ValOrFunc<Bool>,
      classIfTrue : ValOrFunc<String>,
      ?classIfFalse : ValOrFunc<String>) : VElement<Node> {
    return if (conditional.toValue()) addClass(velement, classIfTrue.toValue());
      else if (classIfFalse != null) addClass(velement, classIfFalse.toValue());
      else velement;
  }
  public static var clsif(default, never) = addClassIf;

  public static function addStyle(velement : VElement<Node>, name : ValOrFunc<String>, value : ValOrFunc<String>) : VElement<Node> {
    var styles = getStyles(velement);
    styles[name.toValue()] = value.toValue();
    return velement;
  }
  public static var css(default, never) = addStyle;

  public static function addStyles(velement : VElement<Node>, styles : ValOrFunc<Map<String, String>>) : VElement<Node> {
    for (name in styles.toValue().keys()) {
      addStyle(velement, name, styles.toValue()[name]);
    }
    return velement;
  }

  public static function addStyleIf(
      velement : VElement<Node>,
      conditional : ValOrFunc<Bool>,
      name : ValOrFunc<String>,
      valueIfTrue : ValOrFunc<String>,
      ?valueIfFalse : ValOrFunc<String>) : VElement<Node> {
    return if (conditional.toValue()) addStyle(velement, name.toValue(), valueIfTrue.toValue());
      else if (valueIfFalse != null) addStyle(velement, name.toValue(), valueIfFalse.toValue());
      else velement;
  }
  public static var cssif(default, never) = addStyleIf;

  static function getClasses(velement : VElement<Node>) : Array<String> {
    if (velement.attributes[V_CLASSES_ATTRIBUTE_NAME] == null) {
      velement.attributes[V_CLASSES_ATTRIBUTE_NAME] = new Array<String>();
    }
    return velement.attributes[V_CLASSES_ATTRIBUTE_NAME].toStringArray();
  }

  static function getClassName(velement : VElement<Node>) : String {
    return getClasses(velement).join(" ");
  }

  static function getStyles(velement : VElement<Node>) : Map<String, String> {
    if (velement.attributes[V_STYLES_ATTRIBUTE_NAME] == null) {
      velement.attributes[V_STYLES_ATTRIBUTE_NAME] = new Map<String, String>();
    }
    return velement.attributes[V_STYLES_ATTRIBUTE_NAME].toStringMap();
  }
}
