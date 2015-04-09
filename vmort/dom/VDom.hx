package vmort.dom;

import js.Browser;
import js.Error;
import js.html.Element;
import js.html.Node;
import js.html.Text;
import vmort.ValOrFunc;
import vmort.VNode;
import vmort.VElement;
import vmort.VText;

class VDom {
  public static var V_ID_KEY(default, never) = "id";
  public static var V_CLASSES_KEY(default, never) = "classes";
  public static var V_STYLES_KEY(default, never) = "styles";
  public static var ID_KEY(default, never) = "id";
  public static var CLASS_NAME_KEY(default, never) = "className";
  public static var STYLE_KEY(default, never) = "style";

  public static function createNode(vnode : VNode<Node>) : Node {
    if (vnode.isVText()) {
      return createText(vnode);
    } else {
      return createElement(vnode);
    }
  }

  static function createText(vtext : VText<Node>) : Node {
    var text = Browser.document.createTextNode(vtext.text);
    vtext.ref = text;
    return text;
  }

  static function createElement(velement : VElement<Node>) : Node {
    var element : Element = cast Browser.document.createElement(velement.tag);
    velement.ref = element;

    setAttributes(element, velement.attributes);
    setEventHandlers(element, velement.events);
    setChildren(element, velement.children);

    return element;
  }

  public static function updateNode(vold : VNode<Node>, vnew : VNode<Node>) : Void {
    var patch = Diff.getPatch(vold, vnew);

    if (!patch.isPatchable) {
      // Can't patch the node, so just replace it with vnew
      replaceNode(vold, vnew);
    }

    if (!patch.hasChanges) {
      // Nothing to do, just copy the ref over
      vnew.setRef(vold.getRef());
      return;
    }

    if (patch.isVText) {
      updateText(vold, vnew, patch);
      return;
    }

    if (patch.isVElement) {
      updateElement(vold, vnew, patch);
      return;
    }

    // TODO: not sure if we can get here
    replaceNode(vold, vnew);
  }

  static function updateText(vold : VNode<Node>, vnew : VNode<Node>, patch : Patch<Node>) : Void {
    var textOld : Text = cast vold.toVText().ref;
    textOld.nodeValue = patch.changedText;
    vnew.setRef(textOld);
  }

  static function updateElement(vold : VNode<Node>, vnew : VNode<Node>, patch : Patch<Node>) : Void {
    var element : Element = cast vold.getRef();
    updateAttributes(vold, vnew, element, patch);
    updateEventHandlers(vold, vnew, element, patch);
    updateChildren(vold, vnew, element, patch);
    vnew.setRef(vold.getRef());
  }

  static function updateAttributes(vold : VNode<Node>, vnew : VNode<Node>, element : Element, patch : Patch<Node>) : Void {
    if (!patch.hasAttributeChanges) {
      return;
    }

    if (patch.hasAddedAttributes) {
      var added = patch.addedAttributes;
      for (key in added) {
        setAttribute(element, key, added[key]);
      }
    }

    if (patch.hasRemovedAttributes) {
      var removed = patch.removedAttributes;
      for (key in removed) {
        removeAttribute(element, key);
      }
    }

    if (patch.hasChangedAttributes) {
      var changed = patch.changedAttributes;
      for (key in changed) {
        setAttribute(element, key, changed[key]);
      }
    }
  }

  static function updateEventHandlers(vold : VNode<Node>, vnew : VNode<Node>, element : Element, patch : Patch<Node>) : Void {
    if (!patch.hasEventHandlerChanges) {
      return;
    }

    if (patch.hasAddedEventHandlers) {
      var added = patch.addedEventHandlers;
      for (key in added.keys()) {
        setEventHandler(element, 'on$key', added[key]);
      }
    }

    if (patch.hasRemovedEventHandlers) {
      var removed = patch.removedEventHandlers;
      for (key in removed) {
        removeEventHandler(element, 'on$key');
      }
    }

    if (patch.hasChangedEventHandlers) {
      var changed = patch.changedEventHandlers;
      for (key in changed.keys()) {
        setEventHandler(element, 'on$key', changed[key]);
      }
    }
  }

  static function updateChildren(vold : VNode<Node>, vnew : VNode<Node>, element : Element, patch : Patch<Node>) : Void {
    if (!patch.hasChildrenChanges) {
      return;
    }

    if (patch.hasAddedChildren) {
      var added = patch.addedChildren;
      for (vchild in added) {
      }
    }

    if (patch.hasRemovedChildren) {
    }

    if (patch.hasMovedChildren) {
    }
  }

  static function replaceNode(vold : VNode<Node>, vnew : VNode<Node>) : Void {
    var rnew = createNode(vnew);
    var rold = vold.getRef();
    var roldParent = rold.parentNode;
    roldParent.removeChild(rold);
    roldParent.appendChild(rnew);
  }

  public static function ve(
    ?tag : ValOrFunc<String>,
    ?key : ValOrFunc<String>,
    ?namespace : ValOrFunc<String>,
    ?attributes : ValOrFunc<Map<String, Value>>,
    ?events : ValOrFunc<Map<String, EventHandler>>,
    ?children : ValOrFunc<Array<VNode<Node>>>) : VElement<Node> {
    return new VElement<Node>(tag.getValue(), key.getValue(), namespace.getValue(), attributes.getValue(), events.getValue(), children.getValue());
  }

  public static function vt(text : ValOrFunc<String>) : VText<Node> {
    return new VText<Node>(text.getValue());
  }

  public static function id(velement : VElement<Node>, id : ValOrFunc<String>) {
    velement.attributes[V_ID_KEY] = id.getValue();
    return velement;
  }

  public static function cl(velement : VElement<Node>, className : ValOrFunc<String>) {
    return cls(velement, [className.getValue()]);
  }

  public static function cln(velement : VElement<Node>, classNames : ValOrFunc<String>) {
    return cls(velement, ~/[ \t]+/g.split(classNames.getValue()));
  }

  public static function cls(velement : VElement<Node>, classNames : Array<String>) {
    var classes = getClasses(velement);
    for (className in classNames) {
      classes.push(className);
    }
    return velement;
  }

  public static function clc(
    velement : VElement<Node>,
    conditional : ValOrFunc<Bool>,
    classNameIfTrue : ValOrFunc<String>,
    ?classNameIfFalse : ValOrFunc<String>) : VElement<Node> {
    if (conditional.getValue()) {
      return cl(velement, classNameIfTrue);
    } else {
      if (classNameIfFalse != null) {
        return cl(velement, classNameIfFalse.getValue());
      } else {
        return velement;
      }
    }
  }

  public static function st(velement : VElement<Node>, name : ValOrFunc<String>, value : ValOrFunc<String>) {
    var styles = getStyles(velement);
    styles[name.getValue()] = value.getValue();
    return velement;
  }

  public static function sts(velement : VElement<Node>, s : ValOrFunc<Array<{ name: String, value: String }>>) {
    var styles = getStyles(velement);
    for (style in s.getValue()) {
      styles[style.name] = style.value;
    }
    return velement;
  }

  public static function stc(
      velement : VElement<Node>,
      name : ValOrFunc<String>,
      conditional : ValOrFunc<Bool>,
      valueIfTrue : ValOrFunc<String>,
      ?valueIfFalse : ValOrFunc<String>) {
    if (conditional.getValue()) {
      return st(velement, name.getValue(), valueIfTrue);
    } else {
      if (valueIfFalse != null) {
        return st(velement, name.getValue(), valueIfFalse.getValue());
      } else {
        return velement;
      }
    }
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

  static function getStyles(velement : VElement<Node>) {
    if (velement.attributes[V_STYLES_KEY] == null) {
      velement.attributes[V_STYLES_KEY] = new Map<String, String>();
    }
    return velement.attributes[V_STYLES_KEY].toStringMap();
  }

  static function setAttribute(element : Element, key : String, value : Value) {
    if (key == V_CLASSES_KEY) {
      var className = value.toStringArray().join(" ");
      element.className = className;
      return;
    }

    if (key == V_STYLES_KEY) {
      var styles = value.toStringMap();
      for (styleKey in styles.keys()) {
        element.style.setProperty(styleKey, styles[styleKey]);
      }
      return;
    }

    Reflect.setField(element, key, value.toValue());
  }

  static function setAttributes(element : Element, attributes : Map<String, Value>) {
    for (key in attributes.keys()) {
      setAttribute(element, key, attributes[key]);
    }
  }

  static function removeAttribute(element : Element, key : String) {
    if (key == V_CLASSES_KEY) {
      element.removeAttribute(CLASS_NAME_KEY);
      return;
    }

    if (key == V_STYLES_KEY) {
      element.removeAttribute(STYLE_KEY);
      return;
    }

    Reflect.deleteField(element, key);
  }

  static function setEventHandler(element : Element, key : String, eventHandler : EventHandler) {
    Reflect.setField(element, 'on$key', eventHandler);
  }

  static function setEventHandlers(element : Element, events : Map<String, EventHandler>) {
    for (key in events.keys()) {
      setEventHandler(element, key, events[key]);
    }
  }

  static function removeEventHandler(element : Element, key: String) {
    element.removeAttribute(key);
  }

  static function setChildren(element : Element, vnodes : Array<VNode<Node>>) {
    for (vnode in vnodes) {
      var node = createNode(vnode);
      element.appendChild(node);
    }
  }
}
