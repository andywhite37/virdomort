package virdomort.dom;

import js.Browser;
import js.Error;
import js.html.Element;
import js.html.Node;
import js.html.Text;
import virdomort.ValOrFunc;
import virdomort.VNode;
import virdomort.VElement;
import virdomort.VText;

class Dom {
  public static var CLASSES_KEY(default, never) = "classes";
  public static var STYLES_KEY(default, never) = "styles";

  public static function createNode(vnode : VNode<Node>) : Node {
    if (vnode.isVText()) {
      return createText(vnode);
    } else {
      return createElement(vnode);
    }
  }

  public static function createText(vtext : VText<Node>) : Node {
    var rtext = Browser.document.createTextNode(vtext.text);
    vtext.ref = rtext;
    return rtext;
  }

  public static function createElement(velement : VElement<Node>) : Node {
    var relement = Browser.document.createElement(velement.tag);
    velement.ref = relement;

    setAttributes(relement, velement);
    setEventHandlers(relement, velement);
    setChildren(relement, velement);

    return relement;
  }

  public static function ve(?tag : String, ?key : String, ?namespace : String, ?attributes : Map<String, Value>, ?events : Map<String, EventHandler>, ?children) : VElement<Node> {
    return new VElement<Node>(tag, key, namespace, attributes, events, children);
  }

  public static function vt(text) : VText<Node> {
    return new VText<Node>(text);
  }

  public static function id(velement : VElement<Node>, id : String) {
    velement.attributes["id"] = id;
    return velement;
  }

  public static function cl(velement : VElement<Node>, className : String) {
    return cls(velement, [className]);
  }

  public static function cln(velement : VElement<Node>, classNames : String) {
    return cls(velement, ~/[ \t]+/g.split(classNames));
  }

  public static function cls(velement : VElement<Node>, classNames : Array<String>) {
    var classes = getClasses(velement);
    for (className in classNames) {
      classes.push(className);
    }
    return velement;
  }

  public static function clc(velement : VElement<Node>, conditional : ValOrFunc<Bool>, classNameIfTrue : String, ?classNameIfFalse : String = "") : VElement<Node> {
    if (conditional.getValue()) {
      return cl(velement, classNameIfTrue);
    } else {
      if (classNameIfFalse != null || classNameIfFalse != "") {
        return cl(velement, classNameIfFalse);
      } else {
        return velement;
      }
    }
  }

  public static function st(velement : VElement<Node>, name : String, value : String) {
    var styles = getStyles(velement);
    styles[name] = value;
    return velement;
  }

  public static function sts(velement : VElement<Node>, s : Array<{ name: String, value: String }>) {
    var styles = getStyles(velement);
    for (style in s) {
      styles[style.name] = style.value;
    }
    return velement;
  }

  public static function stc(velement : VElement<Node>, name : String, conditional : ValOrFunc<Bool>, valueIfTrue : String, ?valueIfFalse : String = "") {
    if (conditional.getValue()) {
      return st(velement, name, valueIfTrue);
    } else {
      if (valueIfFalse != null && valueIfFalse != "") {
        return st(velement, name, valueIfFalse);
      } else {
        return velement;
      }
    }
  }

  static function getClasses(velement : VElement<Node>) : Array<String> {
    if (velement.attributes[CLASSES_KEY] == null) {
      velement.attributes[CLASSES_KEY] = new Array<String>();
    }
    return velement.attributes[CLASSES_KEY].toStrings();
  }

  static function getStyles(velement : VElement<Node>) {
    if (velement.attributes[STYLES_KEY] == null) {
      velement.attributes[STYLES_KEY] = new Map<String, String>();
    }
    return velement.attributes[STYLES_KEY].toStringMap();
  }

  static function setAttribute(relement : Node, velement : VElement<Node>, key : String) {
    if (key == CLASSES_KEY) {
      var className = velement.attributes[key].toStrings().join(" ");
      Reflect.setField(relement, "className", className);
      return;
    }

    if (key == STYLES_KEY) {
      var styles = velement.attributes[key].toStringMap();
      var el : Element = cast relement;
      for (styleKey in styles.keys()) {
        Reflect.setField(el.style, styleKey, styles[styleKey]);
      }
      return;
    }

    var value = velement.attributes[key].toValue();
    Reflect.setField(relement, "key", value);
  }

  static function setAttributes(relement : Node, velement : VElement<Node>) {
    for (key in velement.attributes.keys()) {
      setAttribute(relement, velement, key);
    }
  }

  static function setEventHandler(relement : Node, velement : VElement<Node>, key : String) {
    Reflect.setField(relement, 'on$key', velement.events.get(key));
  }

  static function setEventHandlers(relement : Node, velement : VElement<Node>) {
    for (key in velement.events.keys()) {
      setEventHandler(relement, velement, key);
    }
  }

  static function setChildren(relement : Node, velement : VElement<Node>) {
    for (vchild in velement.children) {
      var rchild = createNode(vchild);
      vchild.setRef(rchild);
      relement.appendChild(rchild);
    }
  }
}
