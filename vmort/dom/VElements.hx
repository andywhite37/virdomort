package vmort.dom;

import js.Browser;
import js.html.Element;
import js.html.Node;
using vmort.dom.Elements;
using vmort.util.Arrays;
using vmort.util.Strings;

class VElements {
  public static var V_ID_KEY(default, never) = "id";
  public static var V_CLASSES_KEY(default, never) = "classes";
  public static var V_STYLES_KEY(default, never) = "styles";

  public static function reify(velement : VElement<Node>) : Element {
    var element : Element = cast Browser.document.createElement(velement.tag);
    velement.setRef(element);
    element.addAttributes(velement.attributes);
    element.addEvents(velement.events);
    element.addChildren(velement.children);
    return element;
  }

  public static function setId(velement : VElement<Node>, id : ValOrFunc<String>) {
    return velement.addAttribute(V_ID_KEY, id.getValue());
  }

  public static function addClass(velement : VElement<Node>, className : ValOrFunc<String>) {
    var currentClasses = getClasses(velement);
    var newClasses = className.getValue().splitTrim();
    for (newClass in newClasses) {
      if (!currentClasses.contains(newClass)) {
        currentClasses.push(newClass);
      }
    }
    return velement;
  }

  public static function addClasses(velement : VElement<Node>, classNames : Array<ValOrFunc<String>>) {
    for (className in classNames) {
      addClass(velement, className);
    }
    return velement;
  }

  public static function addClassIf(velement : VElement<Node>, conditional : ValOrFunc<Bool>, classIfTrue : ValOrFunc<String>, ?classIfFalse : ValOrFunc<String>) : VElement<Node> {
    return if (conditional.getValue()) {
      addClass(velement, classIfTrue);
    } else {
      if (classIfFalse != null) {
        addClass(velement, classIfFalse);
      } else {
        velement;
      }
    }
  }

  public static function addStyle(velement : VElement<Node>, name : ValOrFunc<String>, value : ValOrFunc<String>) {
    var currentStyles = getStyles(velement);
    currentStyles[name.getValue()] = value.getValue();
    return velement;
  }

  public static function addStyles(velement : VElement<Node>, s : ValOrFunc<Array<{ name: ValOrFunc<String>, value: ValOrFunc<String> }>>) {
    var currentVStyles = getStyles(velement);
    for (style in s.getValue()) {
      currentVStyles[style.name.getValue()] = style.value.getValue();
    }
    return velement;
  }

  public static function addStyleIf(velement : VElement<Node>, name : ValOrFunc<String>, conditional : ValOrFunc<Bool>, valueIfTrue : ValOrFunc<String>, ?valueIfFalse : ValOrFunc<String>) : VElement<Node> {
    return if (conditional.getValue()) addStyle(velement, name.getValue(), valueIfTrue);
      else if (valueIfFalse != null) addStyle(velement, name.getValue(), valueIfFalse.getValue());
      else velement;
  }

  static function getClasses(velement : VElement<Node>) : Array<String> {
    if (velement.attributes[V_CLASSES_KEY] == null) {
      velement.attributes[V_CLASSES_KEY] = new Array<String>();
    }
    return velement.attributes[V_CLASSES_KEY].toStringArray();
  }

  static function getClassName(velement : VElement<Node>) : String {
    return getClasses(velement).join(" ");
  }

  static function getStyles(velement : VElement<Node>) : Map<String, String> {
    if (velement.attributes[V_STYLES_KEY] == null) {
      velement.attributes[V_STYLES_KEY] = new Map<String, String>();
    }
    return velement.attributes[V_STYLES_KEY].toStringMap();
  }
}
