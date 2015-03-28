package virdomort.dom;

import js.html.Node;
import virdomort.VNode;
import virdomort.VText;

class VTextTools {
  public static function vt(t : String) : VNode<Node> {
    return VText(new VText<Node>(t));
  }
}
