package vmort.dom;

import js.html.Element;
import js.html.Node;
import vmort.VNode;
import vmort.dom.VElements;

class Elements {
  public static var ID_KEY(default, never) = "id";
  public static var CLASS_NAME_KEY(default, never) = "className";
  public static var STYLE_KEY(default, never) = "style";

  public static function addAttribute(element : Element, key : String, value : Value) {
    if (key == VElements.V_CLASSES_KEY) {
      var className = value.toStringArray().join(" ");
      element.className = className;
      return;
    }

    if (key == VElements.V_STYLES_KEY) {
      var styles = value.toStringMap();
      for (styleKey in styles.keys()) {
        element.style.setProperty(styleKey, styles[styleKey]);
      }
      return;
    }

    Reflect.setField(element, key, value.toDynamic());
  }

  public static function addAttributes(element : Element, attributes : Map<String, Value>) {
    for (key in attributes.keys()) {
      addAttribute(element, key, attributes[key]);
    }
  }

  public static function removeAttribute(element : Element, key : String) {
    if (key == VElements.V_CLASSES_KEY) {
      element.removeAttribute(CLASS_NAME_KEY);
      return;
    }

    if (key == VElements.V_STYLES_KEY) {
      element.removeAttribute(STYLE_KEY);
      return;
    }

    Reflect.deleteField(element, key);
  }

  public static function addEvent(element : Element, key : String, eventHandler : EventHandler) {
    Reflect.setField(element, 'on$key', eventHandler);
  }

  public static function addEvents(element : Element, events : Map<String, Array<EventHandler>>) {
    for (key in events.keys()) {
      for (handler in events[key]) {
        addEvent(element, key, handler);
      }
    }
  }

  public static function removeEvent(element : Element, key: String) {
    element.removeAttribute(key);
  }

  public static function addChildren(element : Element, vnodes : Array<VNode<Node>>) {
    for (vnode in vnodes) {
      var node = VNodes.reify(vnode);
      element.appendChild(node);
    }
  }
}
