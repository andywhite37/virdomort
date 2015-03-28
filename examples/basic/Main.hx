package examples.basic;

import js.Browser;
import js.html.Event;
import js.html.MouseEvent;
import js.html.Node;
import virdomort.dom.VElementDomTools.ve;
import virdomort.dom.VTextTools.vt;
using virdomort.VNode;
using virdomort.AttributeValue;
using virdomort.dom.VElementDomTools;
using virdomort.dom.Dom;

class Main {
  static function render(count : Int) {
  }

  public static function main() : Void {
    var myString = "Hello";

    var onClick = function(e : MouseEvent) {
      e.preventDefault();
      trace("click");
    };

    // Showing how to setup the virtual node using a fluent-like interface
    var tree = ve("div", null, null, [
      "id" => VString("test-id"),
      "class" => VString("test-class-1 test-class-2")
    ], [
      "click" => onClick
    ], [
      vt("Hello, world!")
    ]);

    trace(tree);

    var root = Browser.document.getElementById("root");

    var el = Dom.create(tree);

    root.appendChild(el);
  }
}
