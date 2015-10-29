package vmort.dom;

import js.Browser;
import js.html.Node;
import js.html.Text;

class VTexts {
  public static function reify(vtext : VText<Node>) : Text {
    var text = Browser.document.createTextNode(vtext.text);
    vtext.setRef(text);
    return text;
  }
}

