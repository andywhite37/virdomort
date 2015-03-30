package examples.basic;

import js.Browser;
import js.html.Event;
import js.html.MouseEvent;
import js.html.Node;
import virdomort.VNode;
import virdomort.dom.Dom.ve;
import virdomort.dom.Dom.vt;
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

    var tree = ve("div")
      .cl("test-class")
      .cln("test-class-1 test-class-2")
      .clc(true, "class-true-1", "class-false-1")
      .clc(false, "class-true-2", "class-false-2")
      .cs([
        ve("span").c("My Span"),
        ve("br"),
        "Hello, world!"
      ]);

    trace(tree);

    var root = Browser.document.getElementById("root");

    var el = Dom.createNode(tree);

    root.appendChild(el);
  }
}
