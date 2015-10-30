package vmort.dom;

import js.html.Element;
import js.html.Node;
import vmort.VNode;
import vmort.dom.VElements;
using StringTools;

class Elements {
  public static var ID_ATTRIBUTE_NAME(default, never) = "id";
  public static var CLASS_NAME_ATTRIBUTE_NAME(default, never) = "className";
  public static var STYLE_ATTRIBUTE_NAME(default, never) = "style";
  public static var EVENT_PREFIX(default, never) = "on";

  public static function addAttribute(element : Element, name : String, value : Value) : Element {
    if (name == VElements.V_CLASSES_ATTRIBUTE_NAME) {
      var className = value.toStringArray().join(" ");
      element.className = className;
    } else if (name == VElements.V_STYLES_ATTRIBUTE_NAME) {
      var styles = value.toStringMap();
      for (styleKey in styles.keys()) {
        element.style.setProperty(styleKey, styles[styleKey]);
      }
    } else {
      element.setAttribute(name, value.toString());
    }
    return element;
  }

  public static function addAttributes(element : Element, attributes : Map<String, Value>) : Element{
    for (key in attributes.keys()) {
      addAttribute(element, key, attributes[key]);
    }
    return element;
  }

  public static function removeAttribute(element : Element, name : String) : Element {
    if (name == VElements.V_CLASSES_ATTRIBUTE_NAME) {
      element.removeAttribute(CLASS_NAME_ATTRIBUTE_NAME);
    } else if (name == VElements.V_STYLES_ATTRIBUTE_NAME) {
      element.removeAttribute(STYLE_ATTRIBUTE_NAME);
    } else {
      element.removeAttribute(name);
    }
    return element;
  }

  public static function addEvent(element : Element, name : String, eventHandler : EventHandler) : Element {
    if (!name.startsWith(EVENT_PREFIX)) {
      name = '${EVENT_PREFIX}${name}';
    }
    Reflect.setField(element, name, eventHandler);
    return element;
  }

  public static function addEvents(element : Element, events : Map<String, EventHandler>) : Element {
    for (name in events.keys()) {
      addEvent(element, name, events[name]);
    }
    return element;
  }

  public static function removeEvent(element : Element, name: String) : Element {
    if (!name.startsWith(EVENT_PREFIX)) {
      name = '${EVENT_PREFIX}${name}';
    }
    //Reflect.setField(element, name, null);
    Reflect.deleteField(element, name);
    return element;
  }

  public static function addChild(element : Element, vnode : VNode<Node>) : Element {
    var child = VNodes.reify(vnode);
    element.appendChild(child);
    return element;
  }

  public static function addChildren(element : Element, vnodes : Array<VNode<Node>>) : Element {
    for (vnode in vnodes) {
      addChild(element, vnode);
    }
    return element;
  }
}
