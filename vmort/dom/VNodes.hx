package vmort.dom;

import js.html.Node;
using vmort.dom.VElements;
using vmort.dom.VTexts;

class VNodes {
  public static function reify(vnode : VNode<Node>) : Node {
    return switch vnode.toVNodeType() {
      case VNElement(v) : return v.reify();
      case VNText(v) : return v.reify();
    };
  }
}
