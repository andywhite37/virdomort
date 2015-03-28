package virdomort.dom;

import js.Browser;
import js.html.Node;
import virdomort.VNode;

class Dom {
  public static function create(vnode : VNode<Node>) : Node {
    return switch vnode {
      case VText(vtext): createText(vtext);
      case VElement(velement) : createElement(velement);
    };
  }

  public static function createText(vtext : VText<Node>) : Node {
    var rtext = Browser.document.createTextNode(vtext.text);
    vtext.ref = rtext;
    return rtext;
  }

  public static function createElement(velement : VElement<Node>) : Node {
    var relement = Browser.document.createElement(velement.tag);
    velement.ref = relement;

    for (key in velement.attributes.keys()) {
      var value : String = switch velement.attributes[key] {
        case VInt(v): Std.string(v);
        case VFloat(v): Std.string(v);
        case VBool(v): Std.string(v);
        case VString(v) : v;
        case VDate(v): v.toString();
        case VStrings(v): v.join(" ");
        case VStringMap(v): v.toString();
        case VNone: null;
        //case VFloat(i): i.
      };

      Reflect.setField(relement, key, value);
    }

    for (key in velement.events.keys()) {
      Reflect.setField(relement, 'on$key', velement.events.get(key));
    }

    for (vchild in velement.children) {
      var rchild = create(vchild);

      switch vchild {
        case VElement(v): v.ref = rchild;
        case VText(v): v.ref = rchild;
      };

      relement.appendChild(rchild);
    }

    return relement;
  }
}
